
module register32_r_en(clk, reset_n, en, d, q);
  // 32-bit Register with Enable module
  // Inputs: clock (clk), active-low asynchronous reset (reset_n),
  //         enable signal (en), data input (d)
  // Output: registered data output (q)

  input clk, reset_n, en;
  input [31:0] d;
  output reg [31:0] q;

  always @(posedge clk or negedge reset_n)
  begin
    if (reset_n == 0) 
      q <= 32'b0;
    else if (en) 
      q <= d; 
    else 
      q <= q;
  end
endmodule

