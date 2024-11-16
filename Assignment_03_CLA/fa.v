module fa(a,b,ci,s,co); //full adder module

	input a,b,ci; // input a,b ,carry-in
	output s,co; // output S, co:cout
	
	wire c1,c2,sm; // wire c1 : ha_co - U2_or2_a, wire c2 : ha_co - U2_or2_b
	
	ha ha2(.a(b),.b(ci),.s(sm),.co(c1)); // half adder2 input b, cin output : sm, c1
	ha ha1(.a(a),.b(sm),.s(s),.co(c2)); // half adder1 input : a, sm output : s, c2
	_or2 U2_or2(.a(c1), .b(c2), .y(co)); // ha2_cout - c1 or ha1_cout - c2

endmodule
