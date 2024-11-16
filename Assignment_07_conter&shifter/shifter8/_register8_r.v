module _register8_r(clk, reset_n, d, q);
  // 8-bit register with asynchronous reset
  input clk, reset_n;  // Clock and active-low reset signals
  input [7:0] d;       // 8-bit data input
  output [7:0] q;      // 8-bit data output

  // Instantiate D flip-flop module with reset
  _dff_r U0_dff_r(clk, reset_n, d, q);
endmodule
