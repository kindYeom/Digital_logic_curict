module _dff_r_en(clk, reset_n, en, d, q);
  // Positive edge-triggered D flip-flop with enable module
  // Inputs: clock (clk), active-low asynchronous reset (reset_n),
  //         enable signal (en), data input (d)
  // Output: registered data output (q)

  input clk, reset_n, en, d;
  output reg q;

  always @(posedge clk or negedge reset_n)
  begin
    if (reset_n == 0) 
      q <= 1'b0;
    else if (en) 
      q <= d;
    else 
      q <= q;
  end
endmodule

