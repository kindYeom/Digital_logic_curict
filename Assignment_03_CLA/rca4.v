module rca4(a, b, ci, s, co); // 4bit ripple carry adder
	
	input [3:0] a,b; // 4bit input a,b
	input ci; // input carry_in
	output [3:0] s; // 4bit output s
	output co; // carry_out
	
	wire [2:0] c; // wire cout - cin
	
	fa U0_fa(.a(a[0]), .b(b[0]), .ci(ci),.s(s[0]), .co(c[0])); // full adder 0
	fa U1_fa(.a(a[1]), .b(b[1]), .ci(c[0]),.s(s[1]), .co(c[1])); // full adder 1
	fa U2_fa(.a(a[2]), .b(b[2]), .ci(c[1]),.s(s[2]), .co(c[2])); // full adder 2
	fa U3_fa(.a(a[3]), .b(b[3]), .ci(c[2]),.s(s[3]), .co(co)); // full adder 3

endmodule
