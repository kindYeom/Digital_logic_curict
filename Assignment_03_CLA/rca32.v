module rca32(a,b,ci,s,co); // 32bit ripple carry adder
	input [31:0] a,b; // 32bit input a,b
	input ci; // first fulladder carry_in 
	output [31:0] s; // 32bit output s
	output co; // last carry out
	
	wire c1,c2,c3,c4,c5,c6,c7; // 7wire, 4bit_rca to 4bit_rca
	
	rca4 U0_rca4(.a(a[3:0]), .b(b[3:0]), .ci(ci), .s(s[3:0]), .co(c1));// 4bit_rca0
	rca4 U1_rca4(.a(a[7:4]), .b(b[7:4]), .ci(c1), .s(s[7:4]), .co(c2));// 4bit_rca1
	rca4 U2_rca4(.a(a[11:8]), .b(b[11:8]), .ci(c2), .s(s[11:8]), .co(c3));// 4bit_rca2
	rca4 U3_rca4(.a(a[15:12]), .b(b[15:12]), .ci(c3), .s(s[15:12]), .co(c4));// 4bit_rca3
	rca4 U4_rca4(.a(a[19:16]), .b(b[19:16]), .ci(c4), .s(s[19:16]), .co(c5));// 4bit_rca4
	rca4 U5_rca4(.a(a[23:20]), .b(b[23:20]), .ci(c5), .s(s[23:20]), .co(c6));// 4bit_rca5
	rca4 U6_rca4(.a(a[27:24]), .b(b[27:24]), .ci(c6), .s(s[27:24]), .co(c7));// 4bit_rca6
	rca4 U7_rca4(.a(a[31:28]), .b(b[31:28]), .ci(c7), .s(s[31:28]), .co(co)); // 4bit_rca7

endmodule
