module _register3_r(clk, reset_n, d, q);
  // 3-bit Register module with reset
  input clk, reset_n;  // Clock and active-low asynchronous reset inputs
  input [2:0] d;      // 3-bit data input
  output [2:0] q;      // 3-bit data output

  // Instantiate three D flip-flops for each bit of the register
  _dff_r U0_dff_r (.clk(clk), .reset_n(reset_n), .d(d[0]), .q(q[0])); // First bit
  _dff_r U1_dff_r (.clk(clk), .reset_n(reset_n), .d(d[1]), .q(q[1])); // Second bit
  _dff_r U2_dff_r (.clk(clk), .reset_n(reset_n), .d(d[2]), .q(q[2])); // Third bit
endmodule
