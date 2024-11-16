	module multiplier(clk,reset_n,multiplier,multiplicand,op_start,op_clear,op_done,result);
 
	input clk, reset_n,op_clear,op_start;
	input [63:0]multiplier,multiplicand; 

	reg [64:0]mulr;
	wire [63:0]count;

	wire [127:0]result_next;
	wire [63:0]next_count;
	wire [64:0]mulr_next;
	
	wire [64:0]mulr2;
	wire op_done_w;	
	output reg op_done;
	output [127:0]result;

	

	always@(*)begin
		op_done <= op_done_w;
		if(count == 1)begin
			mulr[64:1] = multiplier;
			mulr[0] = 1'b0;
		end
		else if(count == 0)begin
				
		end
		else begin
		mulr = mulr2;
		end
	end
		register_r_op U0_register_r_op(
		.clk(clk),
		.reset_n(reset_n),
		.op_clear(op_clear),
		.result_next(result_next),
		.mulr_next(mulr_next),
		.count_next(next_count),
		.result(result),
		.mulr(mulr2),
		.count(count),
		.op_done(op_done_w)
		);
	
	
	
	select_func U0_select_func(
		.mulr(mulr),
		.mulc(multiplicand),
		.result(result),
		.count(count),
		.op_start(op_start),
		.next_mulr(mulr_next),
		.next_result(result_next),
		.next_count(next_count));



endmodule

 // complete