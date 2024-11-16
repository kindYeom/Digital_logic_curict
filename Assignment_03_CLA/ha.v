module ha(a, b, s, co); // half adder module

	input a, b; // input a,b
	output s, co ; // output s, co

	assign s = a^b; // output s = a xor b
	assign co = a&b; // output co = a And b

endmodule
