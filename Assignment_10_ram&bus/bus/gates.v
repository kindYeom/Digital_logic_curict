
module _inv(a,y);//inverter
	input a;// input a
	output y; // output y
	
assign y=~a; // y = !a

endmodule

module _or2(a,b,y);//2 input or gate
	input a,b; // input a,b
	output y; // output y
	
	assign y=a|b; // y = a OR b

endmodule

module _nand2(a,b,y);//2input nand gate
	input a,b; // input a,b
	output y; // output y
	
	assign y=~(a&b);// y = a Nand b

endmodule

module _xor2(a,b,y); // xor
	input a, b; // input a, b
	output y; // output y

	wire inv_a, inv_b;// wire inv_a,inv_b: inv - and 
	wire w0, w1; //wire and - or
	
	_inv U0_inv(.a(a), .y(inv_a)); // invert a
	_inv U1_inv(.a(b), .y(inv_b));// invert b
	_and2 U2_and2(.a(inv_a), .b(b), .y(w0)); // inv_a And b
	_and2 U3_and2(.a(a),.b(inv_b), .y(w1)); // a And inv_v
	_or2 U4_or2(.a(w0), .b(w1),.y(y));// y = w1 or w0
	
endmodule

module _and2(a,b,y);// 2input and gate
	input a,b; // input a, b
	output y; // output y
	
	assign y=a&b;// output y = a And b
	
endmodule

module _and3(a,b,c,y); //3input and gate module
	input a,b,c; // input a,b,c
	output y; //output y
	
	assign y=a&b&c; // output y = a And b And c

endmodule

module _or3(a,b,c,y); // 3input or gate module
	input a,b,c; // input a,b,c
	output y; // output y
	
	assign y=a|b|c; // y = a OR b OR c
	
endmodule

module _and4(a,b,c,d,y); // 4input and gate module
	input a,b,c,d; // input a,b,c,d
	output y; // output y
	
	assign y= a&b&c&d; // output y = a And b And c And d

endmodule

module _or4(a,b,c,d,y); // 4 input or gate module
	input a,b,c,d; // input a,b,c,d
	output y; // output y
	
	assign y=a|b|c|d; // y = a OR b OR c OR d

endmodule

module _and5(a,b,c,d,e,y); // 5 input and gate module
	input a,b,c,d,e; // input a,b,c,d,e
	output y; // output y
	
	assign y = a&b&c&d&e; // output y = a And b And c And d ANd e
endmodule

module _or5(a, b, c, d, e, y);
    input a, b, c, d, e; // 5-input OR gate module
    output y; // output y
    assign y = a | b | c | d | e; // y = a OR b OR c OR d OR e
endmodule

module _inv_4bits(a, y);
    input [3:0] a; // 4-bit input a
    output [3:0] y; // 4-bit output y
    assign y = ~a; // y = NOT a
endmodule

module _and2_4bits(a, b, y);
    input [3:0] a, b; // 4-bit inputs a and b
    output [3:0] y; // 4-bit output y
    assign y = a & b; // y = a AND b
endmodule

module _or2_4bits(a, b, y);
    input [3:0] a, b; // 4-bit inputs a and b
    output [3:0] y; // 4-bit output y
    assign y = a | b; // y = a OR b
endmodule

module _xor2_4bits(a, b, y);
    input [3:0] a, b; // 4-bit inputs a and b
    output [3:0] y; // 4-bit output y
    // XOR gates for each bit
    _xor2 U0_xor2(.a(a[0]), .b(b[0]), .y(y[0]));
    _xor2 U1_xor2(.a(a[1]), .b(b[1]), .y(y[1]));
    _xor2 U2_xor2(.a(a[2]), .b(b[2]), .y(y[2]));
    _xor2 U3_xor2(.a(a[3]), .b(b[3]), .y(y[3]));
endmodule

module _xnor2_4bits(a, b, y);
    input [3:0] a, b; // 4-bit inputs a and b
    output [3:0] y; // 4-bit output y
    wire [3:0] w0;
    // XOR gates for each bit, followed by an inverter
    _xor2_4bits U0_xor2_4bits(.a(a), .b(b), .y(w0));
    _inv_4bits U1_inv_4bits(.a(w0), .y(y));
endmodule

module _inv_32bits(a, y);
    input [31:0] a; // 32-bit input a
    output [31:0] y; // 32-bit output y
    assign y = ~a; // y = NOT a
endmodule

module _and2_32bits(a, b, y);
    input [31:0] a, b; // 32-bit inputs a and b
    output [31:0] y; // 32-bit output y
    assign y = a & b; // y = a AND b
endmodule

module _or2_32bits(a, b, y);
    input [31:0] a, b; // 32-bit inputs a and b
    output [31:0] y; // 32-bit output y
    assign y = a | b; // y = a OR b
endmodule

module _xor2_32bits(a, b, y);
    input [31:0] a, b; // 32-bit inputs a and b
    output [31:0] y; // 32-bit output y
    // XOR gates for each 4-bit segment
    _xor2_4bits U0_xor2_4bits(.a(a[3:0]), .b(b[3:0]), .y(y[3:0]));
    _xor2_4bits U1_xor2_4bits(.a(a[7:4]), .b(b[7:4]), .y(y[7:4]));
    _xor2_4bits U2_xor2_4bits(.a(a[11:8]), .b(b[11:8]), .y(y[11:8]));
    _xor2_4bits U3_xor2_4bits(.a(a[15:12]), .b(b[15:12]), .y(y[15:12]));
    _xor2_4bits U4_xor2_4bits(.a(a[19:16]), .b(b[19:16]), .y(y[19:16]));
    _xor2_4bits U5_xor2_4bits(.a(a[23:20]), .b(b[23:20]), .y(y[23:20]));
    _xor2_4bits U6_xor2_4bits(.a(a[27:24]), .b(b[27:24]), .y(y[27:24]));
    _xor2_4bits U7_xor2_4bits(.a(a[31:28]), .b(b[31:28]), .y(y[31:28]));
endmodule

module _xnor2_32bits(a, b, y);
    input [31:0] a, b; // 32-bit inputs a and b
    output [31:0] y; // 32-bit output y
    // XNOR gates for each 4-bit segment, achieved by XOR followed by an inverter
    _xnor2_4bits U0_xnor2_4bits(.a(a[3:0]), .b(b[3:0]), .y(y[3:0]));
    _xnor2_4bits U1_xnor2_4bits(.a(a[7:4]), .b(b[7:4]), .y(y[7:4]));
    _xnor2_4bits U2_xnor2_4bits(.a(a[11:8]), .b(b[11:8]), .y(y[11:8]));
    _xnor2_4bits U3_xnor2_4bits(.a(a[15:12]), .b(b[15:12]), .y(y[15:12]));
    _xnor2_4bits U4_xnor2_4bits(.a(a[19:16]), .b(b[19:16]), .y(y[19:16]));
    _xnor2_4bits U5_xnor2_4bits(.a(a[23:20]), .b(b[23:20]), .y(y[23:20]));
    _xnor2_4bits U6_xnor2_4bits(.a(a[27:24]), .b(b[27:24]), .y(y[27:24]));
    _xnor2_4bits U7_xnor2_4bits(.a(a[31:28]), .b(b[31:28]), .y(y[31:28]));
endmodule

