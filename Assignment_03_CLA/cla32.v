module cla32(a, b, ci, s, co); //32 bit cla module
	input [31:0] a, b; // 32bit input a,b
	input ci; //input carry_in
	output [31:0] s; // output 32 sum
	output co;// output carry_out
	
	wire c1, c2, c3, c4, c5, c6, c7;  //wire cout -cin

	cla4 U0_cla4(.a(a[3:0]), .b(b[3:0]), .ci(ci), .s(s[3:0]), .co(c1)); // 4bit cla 0
	cla4 U1_cla4(.a(a[7:4]), .b(b[7:4]), .ci(c1), .s(s[7:4]), .co(c2)); // 4bit cla 1
	cla4 U2_cla4(.a(a[11:8]), .b(b[11:8]), .ci(c2), .s(s[11:8]), .co(c3)); // 4bit cla 2
	cla4 U3_cla4(.a(a[15:12]), .b(b[15:12]), .ci(c3), .s(s[15:12]), .co(c4)); // 4bit cla 3
	cla4 U4_cla4(.a(a[19:16]), .b(b[19:16]), .ci(c4), .s(s[19:16]), .co(c5)); // 4bit cla 4
	cla4 U5_cla4(.a(a[23:20]), .b(b[23:20]), .ci(c5), .s(s[23:20]), .co(c6)); // 4bit cla 5
	cla4 U6_cla4(.a(a[27:24]), .b(b[27:24]), .ci(c6), .s(s[27:24]), .co(c7)); // 4bit cla 6
	cla4 U7_cla4(.a(a[31:28]), .b(b[31:28]), .ci(c7), .s(s[31:28]), .co(co)); // 4bit cla 7
	
endmodule 
