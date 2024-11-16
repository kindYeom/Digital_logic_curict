
module fa_v2(a,b,ci,s);// full adder module
	input a,b,ci; // full adder input a, b, carry in
	output s; // output sum
	
	wire w0; // wire w0 : xor - xor
	
	_xor2 U0_xor0(.a(a),.b(b),.y(w0)); // w0 = a XOR b
	_xor2 U1_xor1(.a(w0),.b(ci),.y(s));// s = w0 XOR ci
	

endmodule
