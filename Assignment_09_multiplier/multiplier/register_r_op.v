
module register_r_op(clk, reset_n, op_clear,result_next,mulr_next,count_next, result,mulr,count);


  input clk, reset_n, op_clear;
  input [64:0]mulr_next;
  input [127:0]result_next;
  input [63:0]count_next;
  
  output reg [127:0]result;
  output reg [64:0]mulr;
  output reg [63:0]count;

  
  
  always @(posedge clk or negedge reset_n)
  begin
    if (reset_n == 0)begin
		result <= 32'h0;
		mulr <= 65'b0;

		count <= 65'b1;
		end
    else if(op_clear == 1)begin
      result <= 32'h0;
		mulr <= 65'h0;
		count <= 65'h1;
	
		end
	 else begin
		result<=result_next;
		mulr<=mulr_next;
		count<=count_next;
		
	 end
  end
endmodule

