
module register3_r(clk, reset_n,d4,d3,d1_0,d1_1, q4,q3,q1_0,q1_1);
  // 3-bit Register
  // Inputs: clock (clk), active-low asynchronous reset (reset_n),
  //         data input (d)
  // Output: registered data output (q)

  input clk, reset_n;
  input [2:0] d3,d1_0,d1_1;
  input [3:0] d4;


	output reg [2:0] q3,q1_0,q1_1;
	output reg [3:0] q4;

	
  always @(posedge clk or negedge reset_n )
  begin
    if (reset_n == 0)begin 
      q4 <= 4'b0;
		q3 <= 3'b0;
		q1_0 <= 3'b0;
		q1_1 <= 3'b111;

		end
	 else begin
      q4 <= d4;
		q3 <= d3;
		q1_0 <= d1_0;
		q1_1 <= d1_1;

		end
  end
  
endmodule

