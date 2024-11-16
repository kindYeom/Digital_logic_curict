
module register_r_op(clk, reset_n, op_clear,result_next,mulr_next,count_next, result,mulr,count,op_done);


  input clk, reset_n, op_clear;
  input [64:0]mulr_next;
  input [127:0]result_next;
  input [63:0]count_next;
  
  output reg [127:0]result;
  output reg [64:0]mulr;
  output reg [63:0]count;
  output reg op_done;

  
  
  always @(posedge clk or negedge reset_n or posedge op_clear)
  begin
    if (reset_n == 0)begin
		result <= 128'h1;
		mulr <= 65'b0;
		count <= 65'b1;
		op_done  = 0;
		end
    else if(op_clear == 1)begin
      result <= 128'h1;
		mulr <= 65'h0;
		count <= 65'h1;
		op_done = 0;
	
		end
	 else begin
		result<=result_next;
		mulr<=mulr_next;
		count<=count_next;
		
		if(count == 0)
			op_done <= 1;
		else
			op_done <= 0;
		
	 end
  end
endmodule

