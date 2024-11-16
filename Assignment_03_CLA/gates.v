
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

module _or5(a,b,c,d,e,y); // 5input or gate module
	input a,b,c,d,e; // input a,b,c,d,e
	output y; // output y
	
	assign y = a|b|c|d|e; // y = a OR b OR c OR d OR e

endmodule

