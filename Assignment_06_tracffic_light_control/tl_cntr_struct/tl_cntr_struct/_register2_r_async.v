module _register2_r_async (clk, reset_n, d, q);
    // Input signals
    input clk;         // Clock signal
    input [1:0] d;     // 2-bit data input
    input reset_n;      // Active-low reset signal
    
    // Output signals
    output [1:0] q;    // 2-bit registered output
    
    // Instantiate two asynchronous D flip-flops
    _dff_r_async U0_dff_r_async(clk, reset_n, d[0], q[0]); // D flip-flop for d[0]
    _dff_r_async U1_dff_r_async(clk, reset_n, d[1], q[1]); // D flip-flop for d[1]
endmodule
