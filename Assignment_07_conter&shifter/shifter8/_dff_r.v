module _dff_r(clk, reset_n, d, q);
	
	input clk, reset_n;
	input [7:0]d;
	output reg [7:0]q;
	
	always@(posedge clk or negedge reset_n)
	
	begin
		if(reset_n == 0) q <= 8'b00000000;
		else q <= d;
	end
 endmodule

 