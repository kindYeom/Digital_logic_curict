module _register3_r(clk, reset_n, d, q);
    // Inputs
    input clk;         // Clock signal
    input [2:0] d;     // 3-bit data input
    input reset_n;      // Active-low reset signal
    
    // Outputs
    output [2:0] q;    // 3-bit registered output
    
    // Instantiate three asynchronous D flip-flops
    _dff_r_async U0_dff_r_async(clk, reset_n, d[0], q[0]); // D flip-flop for d[0]
    _dff_r_async U1_dff_r_async(clk, reset_n, d[1], q[1]); // D flip-flop for d[1]
    _dff_r_async U2_dff_r_async(clk, reset_n, d[2], q[2]); // D flip-flop for d[2]
endmodule
