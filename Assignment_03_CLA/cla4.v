module cla4(a, b, ci, s, co); // module cla4
input [3:0] a, b; // 4 bit cla input a,b
input ci; // input carry in 
output [3:0] s; // 4bit output sum
output co; // output carry out

wire [2:0] c; // 3bit wire : clb output  - full adder 



fa_v2 U0_fa(.a(a[0]),.b(b[0]),.ci(ci),.s(s[0])); // fall adder0
fa_v2 U1_fa(.a(a[1]),.b(b[1]),.ci(c[0]),.s(s[1]));// fall adder1
fa_v2 U2_fa(.a(a[2]),.b(b[2]),.ci(c[1]),.s(s[2]));// fall adder2
fa_v2 U3_fa(.a(a[3]),.b(b[3]),.ci(c[2]),.s(s[3]));// fall adder3

clb4 U4_clb4(.a(a),.b(b),.ci(ci),.c1(c[0]),.c2(c[1]),.c3(c[2]),.co(co)); // clb block


endmodule 



