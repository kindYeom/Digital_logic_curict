module tl_cntr_struct(clk, reset_n, Ta, Tb, La, Lb);
    // Inputs
    input clk, reset_n, Ta, Tb; // Clock, reset, and input signals Ta, Tb
    
    // Outputs
    output [1:0] La, Lb; // 2-bit outputs La, Lb
    
    // Internal wires
    wire [1:0] state; // 2-bit state wire
    wire [1:0] next_state; // 2-bit next state wire

    // Instantiate ns_logic module
    ns_logic U0_ns_logic(.TA(Ta), .TB(Tb), .state(state), .next_state(next_state));
    
    // Instantiate os_logic module
    os_logic U1_os_logic(.state(next_state), .LA(La), .LB(Lb));
    
    // Instantiate _register2_r_async module
    _register2_r_async U2_register2_r(.clk(clk), .reset_n(reset_n), .d(next_state), .q(state));
endmodule
