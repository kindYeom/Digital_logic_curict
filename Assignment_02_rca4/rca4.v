module rca4(a,b,ci,s,co);
	input[3:0] a,b; // four bit input a,b
	input ci; // input ci
	output[3:0] s; // 4bit output s
	output co; // carry out
	wire [2:0] c; // 3bit wire fulladder to fulladder
	
	fa fa0(.a(a[0]),.b(b[0]),.ci(ci),.s(s[0]),.co(c[0])); // full adder0 
	fa fa1(.a(a[1]),.b(b[1]),.ci(c[0]),.s(s[1]),.co(c[1]));// full adder1  ci = full adder0 co
	fa fa2(.a(a[2]),.b(b[2]),.ci(c[1]),.s(s[2]),.co(c[2]));// full adder2 ci = full adder1 co
	fa fa3(.a(a[3]),.b(b[3]),.ci(c[2]),.s(s[3]),.co(co));// full adder3  ci = full adder2 co
	
	

endmodule
			