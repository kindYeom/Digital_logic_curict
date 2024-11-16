module rca_clk(clk,a,b,ci,s,co); // ripple carry adder with register

	input clk; // clock
	input [31:0] a,b; // 32bit input a,b
	input ci;  // carry_in
	output [31:0] s; // 32bit s
	output co; // carry out

	reg [31:0] reg_a, reg_b; // register for a,b
	reg reg_ci;// register for ci
	reg [31:0] reg_s;// register for s
	reg reg_co; // register for co
	
	wire [31:0] wire_s; // wire for s
	wire wire_co; // wire for co

	always@(posedge clk) 
	begin 
		reg_a <= a; // when posedge save a
		reg_b <= b; // when posedge save b
		reg_ci <= ci;  // when posedge save ci
		reg_s <= wire_s;  // when posedge save s
		reg_co <= wire_co; // when posedge save co
	end
	
	rca32 U0_rca32(.a(reg_a), .b(reg_b), .ci(reg_ci),.s(wire_s), .co(wire_co)); 
	
	assign s = reg_s; //output s
	assign co = reg_co; //output co
	
endmodule
