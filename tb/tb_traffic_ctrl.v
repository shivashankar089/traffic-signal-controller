`timescale 1ns/1ps
// Self-checking testbench for traffic_ctrl
module tb_traffic_ctrl;
    reg        clk = 1'b0, reset = 1'b1, tick = 1'b1;
    reg        ped_req = 1'b0, emg_a = 1'b0, emg_b = 1'b0;
    reg  [1:0] timing_sel = 2'd0;
    wire a_red, a_yellow, a_green, b_red, b_yellow, b_green, ped_walk;

    traffic_ctrl dut (
        .clk(clk), .reset(reset), .tick(tick), .ped_req(ped_req),
        .emg_a(emg_a), .emg_b(emg_b), .timing_sel(timing_sel),
        .a_red(a_red), .a_yellow(a_yellow), .a_green(a_green),
        .b_red(b_red), .b_yellow(b_yellow), .b_green(b_green),
        .ped_walk(ped_walk)
    );

    always #5 clk = ~clk;          // 10 ns clock

    integer errors = 0;
    integer len, i, walks;
    reg prev_walk;

    // signal selector used by the helper tasks
    function sig;
        input integer w;
        begin
            case (w)
                0: sig = a_green;
                1: sig = b_green;
                2: sig = ped_walk;
                3: sig = a_yellow;
                4: sig = b_yellow;
                5: sig = (a_red & b_red & ~ped_walk);
                6: sig = (a_green | b_green);
                default: sig = 1'b0;
            endcase
        end
    endfunction

    // wait (max maxc cycles) until signal w becomes 1
    task wait_for;
        input integer w;
        input integer maxc;
        input [8*60:1] name;
        integer k;
        reg found;
        begin
            found = 1'b0; k = 0;
            while (!found && k < maxc) begin
                @(negedge clk);
                if (sig(w)) found = 1'b1;
                k = k + 1;
            end
            if (!found) begin
                $display("FAIL: timeout waiting for %0s", name);
                errors = errors + 1;
            end
        end
    endtask

    // wait until signal w becomes 0
    task wait_low;
        input integer w;
        input integer maxc;
        input [8*60:1] name;
        integer k;
        reg found;
        begin
            found = 1'b0; k = 0;
            while (!found && k < maxc) begin
                @(negedge clk);
                if (!sig(w)) found = 1'b1;
                k = k + 1;
            end
            if (!found) begin
                $display("FAIL: timeout waiting for %0s", name);
                errors = errors + 1;
            end
        end
    endtask

    // for n cycles, signal w must equal expected
    task hold;
        input integer w;
        input integer n;
        input expected;
        input [8*60:1] name;
        integer k;
        begin
            for (k = 0; k < n; k = k + 1) begin
                @(negedge clk);
                if (sig(w) !== expected) begin
                    $display("FAIL: %0s violated at %0t", name, $time);
                    errors = errors + 1;
                end
            end
        end
    endtask

    // count how many cycles signal w stays high (call when it is already high)
    task measure;
        input integer w;
        output integer n;
        reg go;
        begin
            n = 1; go = 1'b1;
            while (go) begin
                @(negedge clk);
                if (sig(w)) n = n + 1; else go = 1'b0;
            end
        end
    endtask

    task check;
        input cond;
        input [8*60:1] name;
        begin
            if (cond) $display("PASS: %0s", name);
            else begin
                $display("FAIL: %0s", name);
                errors = errors + 1;
            end
        end
    endtask

    task pulse_ped;
        begin
            @(negedge clk); ped_req = 1'b1;
            repeat (3) @(negedge clk);
            ped_req = 1'b0;
        end
    endtask

    // ---------- continuous safety monitor ----------
    always @(negedge clk) begin
        if (({1'b0,a_red} + {1'b0,a_yellow} + {1'b0,a_green}) !== 2'd1) begin
            $display("SAFETY FAIL: road A lights not exactly one at %0t", $time);
            errors = errors + 1;
        end
        if (({1'b0,b_red} + {1'b0,b_yellow} + {1'b0,b_green}) !== 2'd1) begin
            $display("SAFETY FAIL: road B lights not exactly one at %0t", $time);
            errors = errors + 1;
        end
        if (a_green && !b_red) begin
            $display("SAFETY FAIL: A green while B not red at %0t", $time);
            errors = errors + 1;
        end
        if (b_green && !a_red) begin
            $display("SAFETY FAIL: B green while A not red at %0t", $time);
            errors = errors + 1;
        end
        if (ped_walk && !(a_red && b_red)) begin
            $display("SAFETY FAIL: pedestrian walk while traffic not red at %0t", $time);
            errors = errors + 1;
        end
    end

    // watchdog
    initial begin
        #2000000;
        $display("FAIL: global timeout");
        $finish;
    end

    initial begin
        $dumpfile("traffic_ctrl.vcd");
        $dumpvars(0, tb_traffic_ctrl);

        // ---- T1: reset, safe state, then normal start ----
        repeat (3) @(negedge clk);
        check(a_red && b_red && !ped_walk, "T1a reset gives all-red");
        reset = 1'b0;
        wait_for(0, 20, "A green after reset");
        check(a_green, "T1b A turns green after reset");

        // ---- T2: normal cycle A -> B -> A ----
        wait_for(1, 60, "B green in normal cycle");
        check(b_green, "T2a B green in normal cycle");
        wait_for(0, 60, "A green again");
        check(a_green, "T2b A green again");

        // ---- T3: green time for each timing_sel (expect G..G+2 cycles) ----
        for (i = 0; i < 4; i = i + 1) begin
            wait_low(0, 80, "A green to end");
            timing_sel = i[1:0];
            wait_for(0, 80, "A green start");
            measure(0, len);
            $display("INFO: timing_sel=%0d -> A green lasted %0d cycles", i, len);
            case (i)
                0: check(len >= 8  && len <= 10, "T3 timing_sel=0 green time");
                1: check(len >= 12 && len <= 14, "T3 timing_sel=1 green time");
                2: check(len >= 16 && len <= 18, "T3 timing_sel=2 green time");
                3: check(len >= 20 && len <= 22, "T3 timing_sel=3 green time");
            endcase
        end
        timing_sel = 2'd0;

        // ---- T4: emergency on A while B is green ----
        wait_for(1, 80, "B green before emergency A");
        repeat (5) @(negedge clk);
        emg_a = 1'b1;
        wait_for(0, 30, "A green for emergency A");
        check(a_green, "T4a emergency A gets green");
        hold(0, 40, 1'b1, "A green held during emergency A");
        emg_a = 1'b0;
        wait_low(0, 10, "A leaves green after emergency");
        check(a_yellow, "T4b A goes yellow after emergency ends");

        // ---- T5: emergency on B while A is green ----
        wait_for(0, 80, "A green before emergency B");
        repeat (5) @(negedge clk);
        emg_b = 1'b1;
        wait_for(1, 30, "B green for emergency B");
        check(b_green, "T5a emergency B gets green");
        hold(1, 40, 1'b1, "B green held during emergency B");
        emg_b = 1'b0;
        wait_low(1, 10, "B leaves green after emergency");
        check(b_yellow, "T5b B goes yellow after emergency ends");

        // ---- T6: both emergencies, A has priority ----
        wait_for(1, 80, "B green before double emergency");
        repeat (5) @(negedge clk);
        emg_a = 1'b1; emg_b = 1'b1;
        wait_for(0, 30, "A green for double emergency");
        check(a_green, "T6a A wins when both emergencies");
        hold(0, 20, 1'b1, "A green held, both emergencies");
        emg_a = 1'b0; emg_b = 1'b0;

        // ---- T7: pedestrian request ----
        wait_for(0, 80, "A green before pedestrian");
        repeat (2) @(negedge clk);
        pulse_ped;
        wait_for(2, 60, "pedestrian walk");
        check(ped_walk && a_red && b_red, "T7a walk with both roads red");
        measure(2, len);
        $display("INFO: ped_walk lasted %0d cycles", len);
        check(len >= 6 && len <= 8, "T7b walk time");
        wait_for(6, 15, "traffic resumes after walk");
        check(a_green || b_green, "T7c traffic resumes after walk");

        // ---- T8: emergency arrives during pedestrian walk ----
        wait_for(0, 80, "A green before ped+emergency");
        repeat (2) @(negedge clk);
        pulse_ped;
        wait_for(2, 60, "pedestrian walk (T8)");
        emg_b = 1'b1;
        measure(2, len);
        check(len >= 6 && len <= 8, "T8a walk not cut by emergency");
        wait_for(1, 12, "B green after walk");
        check(b_green, "T8b emergency B served after walk");
        hold(1, 10, 1'b1, "B green held (T8)");
        emg_b = 1'b0;

        // ---- T9: pedestrian request during emergency is kept ----
        wait_for(0, 80, "A green before T9");
        repeat (5) @(negedge clk);
        emg_a = 1'b1;
        pulse_ped;
        hold(2, 25, 1'b0, "no walk during emergency hold");
        emg_a = 1'b0;
        wait_for(2, 80, "kept pedestrian request served");
        check(ped_walk, "T9 pending pedestrian request served later");

        // ---- T10: stuck pedestrian button gives only one walk ----
        wait_for(0, 80, "A green before T10");
        @(negedge clk);
        ped_req = 1'b1;
        walks = 0;
        prev_walk = 1'b0;
        for (i = 0; i < 150; i = i + 1) begin
            @(negedge clk);
            if (ped_walk && !prev_walk) walks = walks + 1;
            prev_walk = ped_walk;
        end
        ped_req = 1'b0;
        $display("INFO: walk phases with stuck button over 150 cycles = %0d", walks);
        check(walks == 1, "T10 stuck button gives only one walk");

        // ---- T11: tick gating freezes the timers ----
        wait_for(0, 80, "A green before T11");
        tick = 1'b0;
        hold(0, 30, 1'b1, "A green frozen while tick=0");
        tick = 1'b1;
        wait_low(0, 30, "A leaves green after tick returns");
        check(!a_green, "T11 timers resume with tick");

        // ---- T12: reset in the middle of operation ----
        wait_for(1, 80, "B green before mid reset");
        repeat (2) @(negedge clk);
        reset = 1'b1;
        @(negedge clk);
        @(negedge clk);
        check(a_red && b_red && !ped_walk, "T12a reset forces all-red");
        reset = 1'b0;
        wait_for(0, 20, "A green after mid reset");
        check(a_green, "T12b restart after reset");

        // ---- T13: illegal state recovers to all-red then normal ----
        wait_for(0, 40, "A green before T13");
        @(negedge clk);
        force dut.state = 4'd12;
        @(negedge clk);
        check(a_red && b_red && !ped_walk, "T13a illegal state shows all-red");
        release dut.state;
        wait_for(0, 30, "A green after illegal state");
        check(a_green, "T13b recovered from illegal state");

        // ---- T14: random stress (safety monitor runs the whole time) ----
        for (i = 0; i < 20000; i = i + 1) begin
            @(negedge clk);
            tick       = ($random % 4 != 0);
            emg_a      = ($random % 60 == 0) ? ~emg_a : emg_a;
            emg_b      = ($random % 60 == 0) ? ~emg_b : emg_b;
            ped_req    = ($random % 40 == 0) ? ~ped_req : ped_req;
            timing_sel = $random;
            reset      = ($random % 3000 == 0);
        end
        emg_a = 1'b0; emg_b = 1'b0; ped_req = 1'b0; reset = 1'b0; tick = 1'b1;
        wait_for(0, 100, "A green after random stress");
        check(a_green, "T14 random stress survived, controller still alive");

        $display("--------------------------------");
        if (errors == 0) $display("ALL TESTS PASSED");
        else             $display("TESTS FAILED: %0d error(s)", errors);
        $display("--------------------------------");
        $finish;
    end
endmodule
