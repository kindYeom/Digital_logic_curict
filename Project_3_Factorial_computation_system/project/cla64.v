module cla64(a, b, ci, s, co);
	input [63:0] a, b;
	input ci;
	output [63:0] s;

	output co;
	
	wire c1, c2, c3, c4, c5, c6, c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,c31;
	cla4_ov U0_cla4_ov (.a(a[3:0]), .b(b[3:0]), .ci(ci), .s(s[3:0]), .co(c1));
	cla4_ov U1_cla4_ov (.a(a[7:4]), .b(b[7:4]), .ci(c1), .s(s[7:4]), .co(c2));
	cla4_ov U2_cla4_ov (.a(a[11:8]), .b(b[11:8]), .ci(c2), .s(s[11:8]), .co(c3));
	cla4_ov U3_cla4_ov (.a(a[15:12]), .b(b[15:12]), .ci(c3), .s(s[15:12]), .co(c4));
	
	cla4_ov U4_cla4_ov (.a(a[19:16]), .b(b[19:16]), .ci(c4), .s(s[19:16]), .co(c5));
	cla4_ov U5_cla4_ov (.a(a[23:20]), .b(b[23:20]), .ci(c5), .s(s[23:20]), .co(c6));
	cla4_ov U6_cla4_ov (.a(a[27:24]), .b(b[27:24]), .ci(c6), .s(s[27:24]), .co(c7));	
	cla4_ov U7_cla4_ov (.a(a[31:28]), .b(b[31:28]), .ci(c7), .s(s[31:28]), .co(c8));
	
	cla4_ov U8_cla4_ov (.a(a[35:32]), .b(b[35:32]), .ci(c8), .s(s[35:32]), .co(c9));
	cla4_ov U9_cla4_ov (.a(a[39:36]), .b(b[39:36]), .ci(c9), .s(s[39:36]), .co(c10));
	cla4_ov U10_cla4_ov (.a(a[43:40]), .b(b[43:40]), .ci(c10), .s(s[43:40]), .co(c11));
	cla4_ov U11_cla4_ov (.a(a[47:44]), .b(b[47:44]), .ci(c11), .s(s[47:44]), .co(c12));
	
	cla4_ov U12_cla4_ov (.a(a[51:48]), .b(b[51:48]), .ci(c12), .s(s[51:48]), .co(c13));
	cla4_ov U13_cla4_ov (.a(a[55:52]), .b(b[55:52]), .ci(c13), .s(s[55:52]), .co(c14));
	cla4_ov U14_cla4_ov (.a(a[59:56]), .b(b[59:56]), .ci(c14), .s(s[59:56]), .co(c15));
	cla4_ov U15_cla4_ov (.a(a[63:60]), .b(b[63:60]), .ci(c15), .s(s[63:60]), .co(co));
	


	endmodule
