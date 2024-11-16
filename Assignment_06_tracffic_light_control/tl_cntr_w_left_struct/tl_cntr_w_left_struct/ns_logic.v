module ns_logic(TA, TB, TAL, TBL, Q, D);
    // Inputs
    input TA, TB, TAL, TBL;   // Inputs TA, TB, TAL, TBL
    input [2:0] Q;            // 3-bit input Q
    
    // Outputs
    output [2:0] D;           // 3-bit output D
    
    // Internal wires for inverted signals
    wire Q0_bar, Q1_bar, Q2_bar;    
    wire TA_bar, TAL_bar, TB_bar, TBL_bar;
    
    // Inverters for input signals
    _inv U0_inv(.a(Q[2]), .y(Q2_bar));
    _inv U1_inv(.a(Q[1]), .y(Q1_bar));
    _inv U2_inv(.a(Q[0]), .y(Q0_bar));
    _inv U3_inv(.a(TA), .y(TA_bar));    
    _inv U4_inv(.a(TAL), .y(TAL_bar)); 
    _inv U5_inv(.a(TB), .y(TB_bar)); 
    _inv U6_inv(.a(TBL), .y(TBL_bar));
    
    // D2 logic gates
    wire D2_w0, D2_w1, D2_w2;
    _and3 D2_0_and3(.a(Q2_bar), .b(Q[1]), .c(Q[0]), .y(D2_w0));
    _and2 D2_1_and2(.a(Q[2]), .b(Q1_bar), .y(D2_w1));
    _and3 D2_2_and3(.a(Q2_bar), .b(Q[1]), .c(Q0_bar), .y(D2_w2));
    _or3 D2(.a(D2_w0), .b(D2_w1), .c(D2_w2), .y(D[2])); // D2
    
    // D1 logic gates
    wire D1_w0, D1_w1, D1_w2;
    _and3 D1_0_and3(.a(Q2_bar), .b(Q1_bar), .c(Q[0]), .y(D1_w0));
    _and2 D1_1_and2(.a(Q[1]), .b(Q0_bar), .y(D1_w1));
    _and3 D1_2_and3(.a(Q[2]), .b(Q1_bar), .c(Q[0]), .y(D1_w2));
    _or3 D1(.a(D1_w0), .b(D1_w1), .c(D1_w2), .y(D[1])); // D1
    
    // D0 logic gates
    wire D0_w0, D0_w1, D0_w2, D0_w3;
    _and4 D0_0_and4(.a(Q2_bar), .b(Q1_bar), .c(Q0_bar), .d(~TA), .y(D0_w0));
    _and4 D0_1_and2(.a(Q2_bar), .b(Q[1]), .c(Q0_bar), .d(~TAL), .y(D0_w1));
    _and4 D0_2_and2(.a(Q[2]), .b(Q1_bar), .c(Q0_bar), .d(~TB), .y(D0_w2));
    _and4 D0_3_and2(.a(Q[2]), .b(Q[1]), .c(Q0_bar), .d(~TBL), .y(D0_w3));
    _or4 D0(.a(D0_w0), .b(D0_w1), .c(D0_w2), .d(D0_w3), .y(D[0])); // D0
endmodule
