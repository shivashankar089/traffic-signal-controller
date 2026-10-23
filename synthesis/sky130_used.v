`timescale 1ns/1ps
module sky130_fd_sc_hd__a2111oi (
    Y ,
    A1,
    A2,
    B1,
    C1,
    D1
);

    // Module ports
    output Y ;
    input  A1;
    input  A2;
    input  B1;
    input  C1;
    input  D1;

    // Local signals
    wire and0_out  ;
    wire nor0_out_Y;

    //  Name  Output      Other arguments
    and and0 (and0_out  , A1, A2              );
    nor nor0 (nor0_out_Y, B1, C1, D1, and0_out);
    buf buf0 (Y         , nor0_out_Y          );

endmodule
module sky130_fd_sc_hd__a2111oi_0 (
    Y ,
    A1,
    A2,
    B1,
    C1,
    D1
);

    output Y ;
    input  A1;
    input  A2;
    input  B1;
    input  C1;
    input  D1;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__a2111oi base (
        .Y(Y),
        .A1(A1),
        .A2(A2),
        .B1(B1),
        .C1(C1),
        .D1(D1)
    );

endmodule
module sky130_fd_sc_hd__a211o (
    X ,
    A1,
    A2,
    B1,
    C1
);

    // Module ports
    output X ;
    input  A1;
    input  A2;
    input  B1;
    input  C1;

    // Local signals
    wire and0_out ;
    wire or0_out_X;

    //  Name  Output     Other arguments
    and and0 (and0_out , A1, A2          );
    or  or0  (or0_out_X, and0_out, C1, B1);
    buf buf0 (X        , or0_out_X       );

endmodule
module sky130_fd_sc_hd__a211o_1 (
    X ,
    A1,
    A2,
    B1,
    C1
);

    output X ;
    input  A1;
    input  A2;
    input  B1;
    input  C1;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__a211o base (
        .X(X),
        .A1(A1),
        .A2(A2),
        .B1(B1),
        .C1(C1)
    );

endmodule
module sky130_fd_sc_hd__a211oi (
    Y ,
    A1,
    A2,
    B1,
    C1
);

    // Module ports
    output Y ;
    input  A1;
    input  A2;
    input  B1;
    input  C1;

    // Local signals
    wire and0_out  ;
    wire nor0_out_Y;

    //  Name  Output      Other arguments
    and and0 (and0_out  , A1, A2          );
    nor nor0 (nor0_out_Y, and0_out, B1, C1);
    buf buf0 (Y         , nor0_out_Y      );

endmodule
module sky130_fd_sc_hd__a211oi_1 (
    Y ,
    A1,
    A2,
    B1,
    C1
);

    output Y ;
    input  A1;
    input  A2;
    input  B1;
    input  C1;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__a211oi base (
        .Y(Y),
        .A1(A1),
        .A2(A2),
        .B1(B1),
        .C1(C1)
    );

endmodule
module sky130_fd_sc_hd__a21o (
    X ,
    A1,
    A2,
    B1
);

    // Module ports
    output X ;
    input  A1;
    input  A2;
    input  B1;

    // Local signals
    wire and0_out ;
    wire or0_out_X;

    //  Name  Output     Other arguments
    and and0 (and0_out , A1, A2         );
    or  or0  (or0_out_X, and0_out, B1   );
    buf buf0 (X        , or0_out_X      );

endmodule
module sky130_fd_sc_hd__a21o_1 (
    X ,
    A1,
    A2,
    B1
);

    output X ;
    input  A1;
    input  A2;
    input  B1;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__a21o base (
        .X(X),
        .A1(A1),
        .A2(A2),
        .B1(B1)
    );

endmodule
module sky130_fd_sc_hd__a21oi (
    Y ,
    A1,
    A2,
    B1
);

    // Module ports
    output Y ;
    input  A1;
    input  A2;
    input  B1;

    // Local signals
    wire and0_out  ;
    wire nor0_out_Y;

    //  Name  Output      Other arguments
    and and0 (and0_out  , A1, A2         );
    nor nor0 (nor0_out_Y, B1, and0_out   );
    buf buf0 (Y         , nor0_out_Y     );

endmodule
module sky130_fd_sc_hd__a21oi_1 (
    Y ,
    A1,
    A2,
    B1
);

    output Y ;
    input  A1;
    input  A2;
    input  B1;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__a21oi base (
        .Y(Y),
        .A1(A1),
        .A2(A2),
        .B1(B1)
    );

endmodule
module sky130_fd_sc_hd__a221oi (
    Y ,
    A1,
    A2,
    B1,
    B2,
    C1
);

    // Module ports
    output Y ;
    input  A1;
    input  A2;
    input  B1;
    input  B2;
    input  C1;

    // Local signals
    wire and0_out  ;
    wire and1_out  ;
    wire nor0_out_Y;

    //  Name  Output      Other arguments
    and and0 (and0_out  , B1, B2                );
    and and1 (and1_out  , A1, A2                );
    nor nor0 (nor0_out_Y, and0_out, C1, and1_out);
    buf buf0 (Y         , nor0_out_Y            );

endmodule
module sky130_fd_sc_hd__a221oi_1 (
    Y ,
    A1,
    A2,
    B1,
    B2,
    C1
);

    output Y ;
    input  A1;
    input  A2;
    input  B1;
    input  B2;
    input  C1;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__a221oi base (
        .Y(Y),
        .A1(A1),
        .A2(A2),
        .B1(B1),
        .B2(B2),
        .C1(C1)
    );

endmodule
module sky130_fd_sc_hd__a22oi (
    Y ,
    A1,
    A2,
    B1,
    B2
);

    // Module ports
    output Y ;
    input  A1;
    input  A2;
    input  B1;
    input  B2;

    // Local signals
    wire nand0_out ;
    wire nand1_out ;
    wire and0_out_Y;

    //   Name   Output      Other arguments
    nand nand0 (nand0_out , A2, A1              );
    nand nand1 (nand1_out , B2, B1              );
    and  and0  (and0_out_Y, nand0_out, nand1_out);
    buf  buf0  (Y         , and0_out_Y          );

endmodule
module sky130_fd_sc_hd__a22oi_1 (
    Y ,
    A1,
    A2,
    B1,
    B2
);

    output Y ;
    input  A1;
    input  A2;
    input  B1;
    input  B2;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__a22oi base (
        .Y(Y),
        .A1(A1),
        .A2(A2),
        .B1(B1),
        .B2(B2)
    );

endmodule
module sky130_fd_sc_hd__a31o (
    X ,
    A1,
    A2,
    A3,
    B1
);

    // Module ports
    output X ;
    input  A1;
    input  A2;
    input  A3;
    input  B1;

    // Local signals
    wire and0_out ;
    wire or0_out_X;

    //  Name  Output     Other arguments
    and and0 (and0_out , A3, A1, A2     );
    or  or0  (or0_out_X, and0_out, B1   );
    buf buf0 (X        , or0_out_X      );

endmodule
module sky130_fd_sc_hd__a31o_1 (
    X ,
    A1,
    A2,
    A3,
    B1
);

    output X ;
    input  A1;
    input  A2;
    input  A3;
    input  B1;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__a31o base (
        .X(X),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        .B1(B1)
    );

endmodule
module sky130_fd_sc_hd__a31oi (
    Y ,
    A1,
    A2,
    A3,
    B1
);

    // Module ports
    output Y ;
    input  A1;
    input  A2;
    input  A3;
    input  B1;

    // Local signals
    wire and0_out  ;
    wire nor0_out_Y;

    //  Name  Output      Other arguments
    and and0 (and0_out  , A3, A1, A2     );
    nor nor0 (nor0_out_Y, B1, and0_out   );
    buf buf0 (Y         , nor0_out_Y     );

endmodule
module sky130_fd_sc_hd__a31oi_1 (
    Y ,
    A1,
    A2,
    A3,
    B1
);

    output Y ;
    input  A1;
    input  A2;
    input  A3;
    input  B1;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__a31oi base (
        .Y(Y),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        .B1(B1)
    );

endmodule
module sky130_fd_sc_hd__a41oi (
    Y ,
    A1,
    A2,
    A3,
    A4,
    B1
);

    // Module ports
    output Y ;
    input  A1;
    input  A2;
    input  A3;
    input  A4;
    input  B1;

    // Local signals
    wire and0_out  ;
    wire nor0_out_Y;

    //  Name  Output      Other arguments
    and and0 (and0_out  , A1, A2, A3, A4 );
    nor nor0 (nor0_out_Y, B1, and0_out   );
    buf buf0 (Y         , nor0_out_Y     );

endmodule
module sky130_fd_sc_hd__a41oi_1 (
    Y ,
    A1,
    A2,
    A3,
    A4,
    B1
);

    output Y ;
    input  A1;
    input  A2;
    input  A3;
    input  A4;
    input  B1;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__a41oi base (
        .Y(Y),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        .A4(A4),
        .B1(B1)
    );

endmodule
module sky130_fd_sc_hd__and2 (
    X,
    A,
    B
);

    // Module ports
    output X;
    input  A;
    input  B;

    // Local signals
    wire and0_out_X;

    //  Name  Output      Other arguments
    and and0 (and0_out_X, A, B           );
    buf buf0 (X         , and0_out_X     );

endmodule
module sky130_fd_sc_hd__and2_0 (
    X,
    A,
    B
);

    output X;
    input  A;
    input  B;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__and2 base (
        .X(X),
        .A(A),
        .B(B)
    );

endmodule
module sky130_fd_sc_hd__and3 (
    X,
    A,
    B,
    C
);

    // Module ports
    output X;
    input  A;
    input  B;
    input  C;

    // Local signals
    wire and0_out_X;

    //  Name  Output      Other arguments
    and and0 (and0_out_X, C, A, B        );
    buf buf0 (X         , and0_out_X     );

endmodule
module sky130_fd_sc_hd__and3_1 (
    X,
    A,
    B,
    C
);

    output X;
    input  A;
    input  B;
    input  C;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__and3 base (
        .X(X),
        .A(A),
        .B(B),
        .C(C)
    );

endmodule
module sky130_fd_sc_hd__clkinv (
    Y,
    A
);

    // Module ports
    output Y;
    input  A;

    // Local signals
    wire not0_out_Y;

    //  Name  Output      Other arguments
    not not0 (not0_out_Y, A              );
    buf buf0 (Y         , not0_out_Y     );

endmodule
module sky130_fd_sc_hd__clkinv_1 (
    Y,
    A
);

    output Y;
    input  A;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__clkinv base (
        .Y(Y),
        .A(A)
    );

endmodule
module sky130_fd_sc_hd__dfxtp (
    Q  ,
    CLK,
    D
);

    // Module ports
    output Q  ;
    input  CLK;
    input  D  ;

    // Local signals
    wire buf_Q;

    //                         Delay       Name  Output  Other arguments
    sky130_fd_sc_hd__udp_dff$P  dff0 (buf_Q , D, CLK         );
    buf                                    buf0 (Q     , buf_Q          );

endmodule
module sky130_fd_sc_hd__dfxtp_1 (
    Q  ,
    CLK,
    D
);

    output Q  ;
    input  CLK;
    input  D  ;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__dfxtp base (
        .Q(Q),
        .CLK(CLK),
        .D(D)
    );

endmodule
module sky130_fd_sc_hd__nand2 (
    Y,
    A,
    B
);

    // Module ports
    output Y;
    input  A;
    input  B;

    // Local signals
    wire nand0_out_Y;

    //   Name   Output       Other arguments
    nand nand0 (nand0_out_Y, B, A           );
    buf  buf0  (Y          , nand0_out_Y    );

endmodule
module sky130_fd_sc_hd__nand2_1 (
    Y,
    A,
    B
);

    output Y;
    input  A;
    input  B;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__nand2 base (
        .Y(Y),
        .A(A),
        .B(B)
    );

endmodule
module sky130_fd_sc_hd__nand2b (
    Y  ,
    A_N,
    B
);

    // Module ports
    output Y  ;
    input  A_N;
    input  B  ;

    // Local signals
    wire not0_out ;
    wire or0_out_Y;

    //  Name  Output     Other arguments
    not not0 (not0_out , B              );
    or  or0  (or0_out_Y, not0_out, A_N  );
    buf buf0 (Y        , or0_out_Y      );

endmodule
module sky130_fd_sc_hd__nand2b_1 (
    Y  ,
    A_N,
    B
);

    output Y  ;
    input  A_N;
    input  B  ;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__nand2b base (
        .Y(Y),
        .A_N(A_N),
        .B(B)
    );

endmodule
module sky130_fd_sc_hd__nand3 (
    Y,
    A,
    B,
    C
);

    // Module ports
    output Y;
    input  A;
    input  B;
    input  C;

    // Local signals
    wire nand0_out_Y;

    //   Name   Output       Other arguments
    nand nand0 (nand0_out_Y, B, A, C        );
    buf  buf0  (Y          , nand0_out_Y    );

endmodule
module sky130_fd_sc_hd__nand3_1 (
    Y,
    A,
    B,
    C
);

    output Y;
    input  A;
    input  B;
    input  C;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__nand3 base (
        .Y(Y),
        .A(A),
        .B(B),
        .C(C)
    );

endmodule
module sky130_fd_sc_hd__nand3b (
    Y  ,
    A_N,
    B  ,
    C
);

    // Module ports
    output Y  ;
    input  A_N;
    input  B  ;
    input  C  ;

    // Local signals
    wire not0_out   ;
    wire nand0_out_Y;

    //   Name   Output       Other arguments
    not  not0  (not0_out   , A_N            );
    nand nand0 (nand0_out_Y, B, not0_out, C );
    buf  buf0  (Y          , nand0_out_Y    );

endmodule
module sky130_fd_sc_hd__nand3b_1 (
    Y  ,
    A_N,
    B  ,
    C
);

    output Y  ;
    input  A_N;
    input  B  ;
    input  C  ;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__nand3b base (
        .Y(Y),
        .A_N(A_N),
        .B(B),
        .C(C)
    );

endmodule
module sky130_fd_sc_hd__nand4 (
    Y,
    A,
    B,
    C,
    D
);

    // Module ports
    output Y;
    input  A;
    input  B;
    input  C;
    input  D;

    // Local signals
    wire nand0_out_Y;

    //   Name   Output       Other arguments
    nand nand0 (nand0_out_Y, D, C, B, A     );
    buf  buf0  (Y          , nand0_out_Y    );

endmodule
module sky130_fd_sc_hd__nand4_1 (
    Y,
    A,
    B,
    C,
    D
);

    output Y;
    input  A;
    input  B;
    input  C;
    input  D;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__nand4 base (
        .Y(Y),
        .A(A),
        .B(B),
        .C(C),
        .D(D)
    );

endmodule
module sky130_fd_sc_hd__nand4bb (
    Y  ,
    A_N,
    B_N,
    C  ,
    D
);

    // Module ports
    output Y  ;
    input  A_N;
    input  B_N;
    input  C  ;
    input  D  ;

    // Local signals
    wire nand0_out;
    wire or0_out_Y;

    //   Name   Output     Other arguments
    nand nand0 (nand0_out, D, C               );
    or   or0   (or0_out_Y, B_N, A_N, nand0_out);
    buf  buf0  (Y        , or0_out_Y          );

endmodule
module sky130_fd_sc_hd__nand4bb_1 (
    Y  ,
    A_N,
    B_N,
    C  ,
    D
);

    output Y  ;
    input  A_N;
    input  B_N;
    input  C  ;
    input  D  ;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__nand4bb base (
        .Y(Y),
        .A_N(A_N),
        .B_N(B_N),
        .C(C),
        .D(D)
    );

endmodule
module sky130_fd_sc_hd__nor2 (
    Y,
    A,
    B
);

    // Module ports
    output Y;
    input  A;
    input  B;

    // Local signals
    wire nor0_out_Y;

    //  Name  Output      Other arguments
    nor nor0 (nor0_out_Y, A, B           );
    buf buf0 (Y         , nor0_out_Y     );

endmodule
module sky130_fd_sc_hd__nor2_1 (
    Y,
    A,
    B
);

    output Y;
    input  A;
    input  B;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__nor2 base (
        .Y(Y),
        .A(A),
        .B(B)
    );

endmodule
module sky130_fd_sc_hd__nor2b (
    Y  ,
    A  ,
    B_N
);

    // Module ports
    output Y  ;
    input  A  ;
    input  B_N;

    // Local signals
    wire not0_out  ;
    wire and0_out_Y;

    //  Name  Output      Other arguments
    not not0 (not0_out  , A              );
    and and0 (and0_out_Y, not0_out, B_N  );
    buf buf0 (Y         , and0_out_Y     );

endmodule
module sky130_fd_sc_hd__nor2b_1 (
    Y  ,
    A  ,
    B_N
);

    output Y  ;
    input  A  ;
    input  B_N;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__nor2b base (
        .Y(Y),
        .A(A),
        .B_N(B_N)
    );

endmodule
module sky130_fd_sc_hd__nor3 (
    Y,
    A,
    B,
    C
);

    // Module ports
    output Y;
    input  A;
    input  B;
    input  C;

    // Local signals
    wire nor0_out_Y;

    //  Name  Output      Other arguments
    nor nor0 (nor0_out_Y, C, A, B        );
    buf buf0 (Y         , nor0_out_Y     );

endmodule
module sky130_fd_sc_hd__nor3_1 (
    Y,
    A,
    B,
    C
);

    output Y;
    input  A;
    input  B;
    input  C;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__nor3 base (
        .Y(Y),
        .A(A),
        .B(B),
        .C(C)
    );

endmodule
module sky130_fd_sc_hd__nor3b (
    Y  ,
    A  ,
    B  ,
    C_N
);

    // Module ports
    output Y  ;
    input  A  ;
    input  B  ;
    input  C_N;

    // Local signals
    wire nor0_out  ;
    wire and0_out_Y;

    //  Name  Output      Other arguments
    nor nor0 (nor0_out  , A, B           );
    and and0 (and0_out_Y, C_N, nor0_out  );
    buf buf0 (Y         , and0_out_Y     );

endmodule
module sky130_fd_sc_hd__nor3b_1 (
    Y  ,
    A  ,
    B  ,
    C_N
);

    output Y  ;
    input  A  ;
    input  B  ;
    input  C_N;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__nor3b base (
        .Y(Y),
        .A(A),
        .B(B),
        .C_N(C_N)
    );

endmodule
module sky130_fd_sc_hd__nor4 (
    Y,
    A,
    B,
    C,
    D
);

    // Module ports
    output Y;
    input  A;
    input  B;
    input  C;
    input  D;

    // Local signals
    wire nor0_out_Y;

    //  Name  Output      Other arguments
    nor nor0 (nor0_out_Y, A, B, C, D     );
    buf buf0 (Y         , nor0_out_Y     );

endmodule
module sky130_fd_sc_hd__nor4_1 (
    Y,
    A,
    B,
    C,
    D
);

    output Y;
    input  A;
    input  B;
    input  C;
    input  D;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__nor4 base (
        .Y(Y),
        .A(A),
        .B(B),
        .C(C),
        .D(D)
    );

endmodule
module sky130_fd_sc_hd__o2111ai (
    Y ,
    A1,
    A2,
    B1,
    C1,
    D1
);

    // Module ports
    output Y ;
    input  A1;
    input  A2;
    input  B1;
    input  C1;
    input  D1;

    // Local signals
    wire or0_out    ;
    wire nand0_out_Y;

    //   Name   Output       Other arguments
    or   or0   (or0_out    , A2, A1             );
    nand nand0 (nand0_out_Y, C1, B1, D1, or0_out);
    buf  buf0  (Y          , nand0_out_Y        );

endmodule
module sky130_fd_sc_hd__o2111ai_1 (
    Y ,
    A1,
    A2,
    B1,
    C1,
    D1
);

    output Y ;
    input  A1;
    input  A2;
    input  B1;
    input  C1;
    input  D1;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__o2111ai base (
        .Y(Y),
        .A1(A1),
        .A2(A2),
        .B1(B1),
        .C1(C1),
        .D1(D1)
    );

endmodule
module sky130_fd_sc_hd__o211ai (
    Y ,
    A1,
    A2,
    B1,
    C1
);

    // Module ports
    output Y ;
    input  A1;
    input  A2;
    input  B1;
    input  C1;

    // Local signals
    wire or0_out    ;
    wire nand0_out_Y;

    //   Name   Output       Other arguments
    or   or0   (or0_out    , A2, A1         );
    nand nand0 (nand0_out_Y, C1, or0_out, B1);
    buf  buf0  (Y          , nand0_out_Y    );

endmodule
module sky130_fd_sc_hd__o211ai_1 (
    Y ,
    A1,
    A2,
    B1,
    C1
);

    output Y ;
    input  A1;
    input  A2;
    input  B1;
    input  C1;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__o211ai base (
        .Y(Y),
        .A1(A1),
        .A2(A2),
        .B1(B1),
        .C1(C1)
    );

endmodule
module sky130_fd_sc_hd__o21ai (
    Y ,
    A1,
    A2,
    B1
);

    // Module ports
    output Y ;
    input  A1;
    input  A2;
    input  B1;

    // Local signals
    wire or0_out    ;
    wire nand0_out_Y;

    //   Name   Output       Other arguments
    or   or0   (or0_out    , A2, A1         );
    nand nand0 (nand0_out_Y, B1, or0_out    );
    buf  buf0  (Y          , nand0_out_Y    );

endmodule
module sky130_fd_sc_hd__o21ai_0 (
    Y ,
    A1,
    A2,
    B1
);

    output Y ;
    input  A1;
    input  A2;
    input  B1;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__o21ai base (
        .Y(Y),
        .A1(A1),
        .A2(A2),
        .B1(B1)
    );

endmodule
module sky130_fd_sc_hd__o221ai (
    Y ,
    A1,
    A2,
    B1,
    B2,
    C1
);

    // Module ports
    output Y ;
    input  A1;
    input  A2;
    input  B1;
    input  B2;
    input  C1;

    // Local signals
    wire or0_out    ;
    wire or1_out    ;
    wire nand0_out_Y;

    //   Name   Output       Other arguments
    or   or0   (or0_out    , B2, B1              );
    or   or1   (or1_out    , A2, A1              );
    nand nand0 (nand0_out_Y, or1_out, or0_out, C1);
    buf  buf0  (Y          , nand0_out_Y         );

endmodule
module sky130_fd_sc_hd__o221ai_1 (
    Y ,
    A1,
    A2,
    B1,
    B2,
    C1
);

    output Y ;
    input  A1;
    input  A2;
    input  B1;
    input  B2;
    input  C1;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__o221ai base (
        .Y(Y),
        .A1(A1),
        .A2(A2),
        .B1(B1),
        .B2(B2),
        .C1(C1)
    );

endmodule
module sky130_fd_sc_hd__o311ai (
    Y ,
    A1,
    A2,
    A3,
    B1,
    C1
);

    // Module ports
    output Y ;
    input  A1;
    input  A2;
    input  A3;
    input  B1;
    input  C1;

    // Local signals
    wire or0_out    ;
    wire nand0_out_Y;

    //   Name   Output       Other arguments
    or   or0   (or0_out    , A2, A1, A3     );
    nand nand0 (nand0_out_Y, C1, or0_out, B1);
    buf  buf0  (Y          , nand0_out_Y    );

endmodule
module sky130_fd_sc_hd__o311ai_0 (
    Y ,
    A1,
    A2,
    A3,
    B1,
    C1
);

    output Y ;
    input  A1;
    input  A2;
    input  A3;
    input  B1;
    input  C1;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__o311ai base (
        .Y(Y),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        .B1(B1),
        .C1(C1)
    );

endmodule
module sky130_fd_sc_hd__o31a (
    X ,
    A1,
    A2,
    A3,
    B1
);

    // Module ports
    output X ;
    input  A1;
    input  A2;
    input  A3;
    input  B1;

    // Local signals
    wire or0_out   ;
    wire and0_out_X;

    //  Name  Output      Other arguments
    or  or0  (or0_out   , A2, A1, A3     );
    and and0 (and0_out_X, or0_out, B1    );
    buf buf0 (X         , and0_out_X     );

endmodule
module sky130_fd_sc_hd__o31a_1 (
    X ,
    A1,
    A2,
    A3,
    B1
);

    output X ;
    input  A1;
    input  A2;
    input  A3;
    input  B1;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__o31a base (
        .X(X),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        .B1(B1)
    );

endmodule
module sky130_fd_sc_hd__o31ai (
    Y ,
    A1,
    A2,
    A3,
    B1
);

    // Module ports
    output Y ;
    input  A1;
    input  A2;
    input  A3;
    input  B1;

    // Local signals
    wire or0_out    ;
    wire nand0_out_Y;

    //   Name   Output       Other arguments
    or   or0   (or0_out    , A2, A1, A3     );
    nand nand0 (nand0_out_Y, B1, or0_out    );
    buf  buf0  (Y          , nand0_out_Y    );

endmodule
module sky130_fd_sc_hd__o31ai_1 (
    Y ,
    A1,
    A2,
    A3,
    B1
);

    output Y ;
    input  A1;
    input  A2;
    input  A3;
    input  B1;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__o31ai base (
        .Y(Y),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        .B1(B1)
    );

endmodule
module sky130_fd_sc_hd__o32a (
    X ,
    A1,
    A2,
    A3,
    B1,
    B2
);

    // Module ports
    output X ;
    input  A1;
    input  A2;
    input  A3;
    input  B1;
    input  B2;

    // Local signals
    wire or0_out   ;
    wire or1_out   ;
    wire and0_out_X;

    //  Name  Output      Other arguments
    or  or0  (or0_out   , A2, A1, A3      );
    or  or1  (or1_out   , B2, B1          );
    and and0 (and0_out_X, or0_out, or1_out);
    buf buf0 (X         , and0_out_X      );

endmodule
module sky130_fd_sc_hd__o32a_1 (
    X ,
    A1,
    A2,
    A3,
    B1,
    B2
);

    output X ;
    input  A1;
    input  A2;
    input  A3;
    input  B1;
    input  B2;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__o32a base (
        .X(X),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        .B1(B1),
        .B2(B2)
    );

endmodule
module sky130_fd_sc_hd__or2 (
    X,
    A,
    B
);

    // Module ports
    output X;
    input  A;
    input  B;

    // Local signals
    wire or0_out_X;

    //  Name  Output     Other arguments
    or  or0  (or0_out_X, B, A           );
    buf buf0 (X        , or0_out_X      );

endmodule
module sky130_fd_sc_hd__or2_0 (
    X,
    A,
    B
);

    output X;
    input  A;
    input  B;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__or2 base (
        .X(X),
        .A(A),
        .B(B)
    );

endmodule
module sky130_fd_sc_hd__or3 (
    X,
    A,
    B,
    C
);

    // Module ports
    output X;
    input  A;
    input  B;
    input  C;

    // Local signals
    wire or0_out_X;

    //  Name  Output     Other arguments
    or  or0  (or0_out_X, B, A, C        );
    buf buf0 (X        , or0_out_X      );

endmodule
module sky130_fd_sc_hd__or3_1 (
    X,
    A,
    B,
    C
);

    output X;
    input  A;
    input  B;
    input  C;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__or3 base (
        .X(X),
        .A(A),
        .B(B),
        .C(C)
    );

endmodule
module sky130_fd_sc_hd__or4 (
    X,
    A,
    B,
    C,
    D
);

    // Module ports
    output X;
    input  A;
    input  B;
    input  C;
    input  D;

    // Local signals
    wire or0_out_X;

    //  Name  Output     Other arguments
    or  or0  (or0_out_X, D, C, B, A     );
    buf buf0 (X        , or0_out_X      );

endmodule
module sky130_fd_sc_hd__or4_1 (
    X,
    A,
    B,
    C,
    D
);

    output X;
    input  A;
    input  B;
    input  C;
    input  D;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__or4 base (
        .X(X),
        .A(A),
        .B(B),
        .C(C),
        .D(D)
    );

endmodule
module sky130_fd_sc_hd__xnor2 (
    Y,
    A,
    B
);

    // Module ports
    output Y;
    input  A;
    input  B;

    // Local signals
    wire xnor0_out_Y;

    //   Name   Output       Other arguments
    xnor xnor0 (xnor0_out_Y, A, B           );
    buf  buf0  (Y          , xnor0_out_Y    );

endmodule
module sky130_fd_sc_hd__xnor2_1 (
    Y,
    A,
    B
);

    output Y;
    input  A;
    input  B;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__xnor2 base (
        .Y(Y),
        .A(A),
        .B(B)
    );

endmodule
module sky130_fd_sc_hd__xor2 (
    X,
    A,
    B
);

    // Module ports
    output X;
    input  A;
    input  B;

    // Local signals
    wire xor0_out_X;

    //  Name  Output      Other arguments
    xor xor0 (xor0_out_X, B, A           );
    buf buf0 (X         , xor0_out_X     );

endmodule
module sky130_fd_sc_hd__xor2_1 (
    X,
    A,
    B
);

    output X;
    input  A;
    input  B;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__xor2 base (
        .X(X),
        .A(A),
        .B(B)
    );

endmodule