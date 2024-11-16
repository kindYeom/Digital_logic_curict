module cla_clk(clk, a, b, ci, s, co);// carry look ahead with clock
	input clk; // clock
	input [31:0] a, b; //32bit input a,b
	input ci;// input carry_in
	output [31:0] s; // output sum
	output co; // output carry_out
	
	reg [31:0] reg_a, reg_b; // 32bit register a,b
	reg reg_ci;//register for ci
	reg [31:0] reg_s; // 32bit register for s
	reg reg_co;// register for co
	
	wire [31:0] wire_s; // wire s
	wire wire_co;// wire cout
	
	always @ (posedge clk)
	begin
		reg_a <= a;// when clock posedge reg_a =a
		reg_b <= b;// when clock posedge reg_b =b
		reg_ci <= ci;// when clock posedge reg_ci =ci
		reg_s <= wire_s;	// when clock posedge reg_s = wire_s
		reg_co <= wire_co;// when clock posedge reg_co = wire_co
	end

	cla32 U0_cla32(.a(reg_a), .b(reg_b), .ci(reg_ci), .s(wire_s), .co(wire_co));
	//32 bit cla
	assign s = reg_s; // output s = reg_s
	assign co = reg_co; // output co = reg_co
	
endmodule

