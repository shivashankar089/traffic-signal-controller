`timescale 1ns/1ps
// Traffic signal controller with emergency override and pedestrian request
module traffic_ctrl #(
    parameter [7:0] G0 = 8'd8,        // green time presets (ticks)
    parameter [7:0] G1 = 8'd12,
    parameter [7:0] G2 = 8'd16,
    parameter [7:0] G3 = 8'd20,
    parameter [7:0] YELLOW    = 8'd3,
    parameter [7:0] ALLRED    = 8'd2,
    parameter [7:0] PED_TIME  = 8'd6,
    parameter [7:0] MIN_GREEN = 8'd3  // minimum green before emergency cut-in
)(
    input  wire       clk,
    input  wire       reset,       // active-high, synchronous
    input  wire       tick,        // one pulse per time unit (e.g. 1 Hz)
    input  wire       ped_req,
    input  wire       emg_a,
    input  wire       emg_b,
    input  wire [1:0] timing_sel,  // selects green-time preset
    output reg        a_red, a_yellow, a_green,
    output reg        b_red, b_yellow, b_green,
    output reg        ped_walk
);
    localparam [3:0] S_A_GREEN = 4'd0, S_A_YEL = 4'd1, S_RED_AB = 4'd2,
                     S_B_GREEN = 4'd3, S_B_YEL = 4'd4, S_RED_BA = 4'd5,
                     S_PED     = 4'd6, S_SAFE  = 4'd7;

    reg [3:0] state, nstate;
    reg [7:0] cnt, min_cnt;
    reg       ped_pending, resume_b, ped_d;
    reg [1:0] sync_a, sync_b, sync_p;   // 2-flop synchronizers

    wire emg_a_s  = sync_a[1];
    wire emg_b_s  = sync_b[1];
    wire ped_s    = sync_p[1];
    wire emg_any  = emg_a_s | emg_b_s;
    wire done     = (cnt == 8'd0);
    wire min_done = (min_cnt == 8'd0);
    wire ped_rise = ped_s & ~ped_d;

    function [7:0] dur;
        input [3:0] s;
        input [1:0] sel;
        begin
            case (s)
                S_A_GREEN, S_B_GREEN: begin
                    case (sel)
                        2'd0: dur = G0;
                        2'd1: dur = G1;
                        2'd2: dur = G2;
                        default: dur = G3;
                    endcase
                end
                S_A_YEL, S_B_YEL: dur = YELLOW;
                S_PED:            dur = PED_TIME;
                default:          dur = ALLRED;
            endcase
        end
    endfunction

    // next-state logic
    always @* begin
        nstate = state;
        case (state)
            S_A_GREEN: begin
                if (emg_a_s) nstate = S_A_GREEN;
                else if (done || (emg_b_s && min_done)) nstate = S_A_YEL;
            end
            S_A_YEL: if (done) nstate = S_RED_AB;
            S_RED_AB: if (done) begin
                if (ped_pending && !emg_any) nstate = S_PED;
                else if (emg_a_s)            nstate = S_A_GREEN;
                else                         nstate = S_B_GREEN;
            end
            S_B_GREEN: begin
                if (emg_b_s && !emg_a_s) nstate = S_B_GREEN;
                else if (done || (emg_a_s && min_done)) nstate = S_B_YEL;
            end
            S_B_YEL: if (done) nstate = S_RED_BA;
            S_RED_BA: if (done) begin
                if (ped_pending && !emg_any)   nstate = S_PED;
                else if (emg_b_s && !emg_a_s)  nstate = S_B_GREEN;
                else                           nstate = S_A_GREEN;
            end
            S_PED: if (done) begin
                if (emg_a_s)        nstate = S_A_GREEN;
                else if (emg_b_s)   nstate = S_B_GREEN;
                else if (resume_b)  nstate = S_B_GREEN;
                else                nstate = S_A_GREEN;
            end
            S_SAFE: if (done) begin
                if (emg_b_s && !emg_a_s) nstate = S_B_GREEN;
                else                     nstate = S_A_GREEN;
            end
            default: nstate = S_SAFE;   // illegal state -> safe state
        endcase
    end

    // registers
    always @(posedge clk) begin
        if (reset) begin
            state <= S_SAFE;  cnt <= ALLRED;  min_cnt <= 8'd0;
            ped_pending <= 1'b0;  resume_b <= 1'b0;  ped_d <= 1'b0;
            sync_a <= 2'b00;  sync_b <= 2'b00;  sync_p <= 2'b00;
        end else begin
            sync_a <= {sync_a[0], emg_a};
            sync_b <= {sync_b[0], emg_b};
            sync_p <= {sync_p[0], ped_req};
            ped_d  <= ped_s;
            state  <= nstate;

            if (nstate != state) begin
                cnt <= dur(nstate, timing_sel);
                if (nstate == S_A_GREEN || nstate == S_B_GREEN)
                    min_cnt <= MIN_GREEN;
            end else if (tick) begin
                if (!done)     cnt     <= cnt - 8'd1;
                if (!min_done) min_cnt <= min_cnt - 8'd1;
            end

            if (state != S_PED && nstate == S_PED) ped_pending <= 1'b0;
            else if (ped_rise && state != S_PED)   ped_pending <= 1'b1;

            if (state == S_RED_AB && nstate == S_PED)      resume_b <= 1'b1;
            else if (state == S_RED_BA && nstate == S_PED) resume_b <= 1'b0;
        end
    end

    // output decode (default: everything red)
    always @* begin
        a_red = 1'b1; a_yellow = 1'b0; a_green = 1'b0;
        b_red = 1'b1; b_yellow = 1'b0; b_green = 1'b0;
        ped_walk = 1'b0;
        case (state)
            S_A_GREEN: begin a_red = 1'b0; a_green  = 1'b1; end
            S_A_YEL:   begin a_red = 1'b0; a_yellow = 1'b1; end
            S_B_GREEN: begin b_red = 1'b0; b_green  = 1'b1; end
            S_B_YEL:   begin b_red = 1'b0; b_yellow = 1'b1; end
            S_PED:     ped_walk = 1'b1;
            default: ;
        endcase
    end
endmodule
