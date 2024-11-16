module tl_cntr_w_left_struct(clk, reset_n, Ta, Tb, La, Lb, Tbl, Tal);
    // Inputs
    input clk, reset_n, Ta, Tb, Tal, Tbl; // Clock, reset, and input signals
    
    // Outputs
    output [1:0] La, Lb; // 2-bit outputs La, Lb
    
    // Internal wires
    wire [2:0] next_state; // 3-bit next state wire
    wire [2:0] state;      // 3-bit state wire

    // Instantiate ns_logic module
    ns_logic U0_ns_logic(.TA(Ta), .TB(Tb), .TAL(Tal), .TBL(Tbl), .Q(state), .D(next_state));
    
    // Instantiate o_logic module
    o_logic U1_os_logic(.state(state), .LA(La), .LB(Lb));
    
    // Instantiate _register3_r module
    _register3_r U2_register3_r(.clk(clk), .reset_n(reset_n), .d(next_state), .q(state));
endmodule
