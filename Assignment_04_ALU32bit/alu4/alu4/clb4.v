module clb4(a,b,ci,c1,c2,c3,co); // 4bit cla module

	input [3:0]a,b; // 3bit input a,b
	input ci; // input carry in
	output c1,c2,c3,co; // output c1,c2,c3,carry out
	
	wire[3:0] g,p; // 4bit wire g, p
	wire w0_c1; //wire w0_c1 for carry out1
	wire w0_c2, w1_c2; //wire w0_c2, wire w1_c2 for carry out2
	wire w0_c3, w1_c3,w2_c3; //wire w0_c3, wire w1_c3, w2_c3 for carry out2
	wire w0_co, w1_co,w2_co,w3_co; //wire w0_co, wire w1_co, w2_co, w3_co for carry out2
	
	
	
	//Generate: when carry in is 0
	_and2 U0_and2(.a(a[0]),.b(b[0]),.y(g[0])); // g0 = a0 And b0
	_and2 U1_and2(.a(a[1]),.b(b[1]),.y(g[1])); // g1 = a1 And b1
	_and2 U2_and2(.a(a[2]),.b(b[2]),.y(g[2])); // g2 = a2 And b2
	_and2 U3_and2(.a(a[3]),.b(b[3]),.y(g[3])); // g3 = a3 and b3
	
	//Propagate when cin is 1
	_or2 U0_or2(.a(a[0]),.b(b[0]),.y(p[0])); // p0 = a0 And b0
	_or2 U1_or2(.a(a[1]),.b(b[1]),.y(p[1])); // p1 = a1 And b1
	_or2 U2_or2(.a(a[2]),.b(b[2]),.y(p[2])); // p2 = a2 And b2
	_or2 U3_or2(.a(a[3]),.b(b[3]),.y(p[3])); // p3 = a3 And b3

	//first carryout 
	_and2 c1_and2(.a(p[0]),.b(ci),.y(w0_c1)); // p[0] & ci
	_or2 c1_or(.a(g[0]),.b(w0_c1),.y(c1)); // g[0] | (p[0] & ci)
	//c1 = g[0] | (p[0] & ci);
	
	//second carryout 
	_and2 c2_and2(.a(p[1]),.b(g[0]),.y(w0_c2));// p[1] & g[0]
	_and3 c2_and3(.a(p[1]),.b(p[0]),.c(ci),.y(w1_c2)); // p[1] & p[0] & ci
	_or3 c2_or3(.a(g[1]),.b(w0_c2),.c(w1_c2),.y(c2));
	// c2 = g[1] | (p[1] & g[0]) | (p[1] & p[0] & ci);
	
	//third carry out
	_and2 c3_and2(.a(p[2]),.b(g[1]),.y(w0_c3)); // p[2] & g[1]
	_and3 c3_and3(.a(p[2]),.b(p[1]),.c(g[0]),.y(w1_c3)); // p[2] & p[1] & g[0]
	_and4 c3_and4(.a(p[2]),.b(p[1]),.c(p[0]),.d(ci),.y(w2_c3)); // p[2] & p[1] & p[0] & ci
	_or4 c3_or4(.a(g[2]),.b(w0_c3),.c(w1_c3),.d(w2_c3),.y(c3)); 
	//g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & ci)
	
	//last carry out
	_and2 co_and2(.a(p[3]),.b(g[2]),.y(w0_co)); // p[3] & g[2]
	_and3 co_and3(.a(p[3]),.b(p[2]),.c(g[1]),.y(w1_co));// p[3] & p[2] & g[1]
	_and4 co_and4(.a(p[3]),.b(p[2]),.c(p[1]),.d(g[0]),.y(w2_co));// p[3] & p[2] & p[1] & g[0]
	_and5 co_and5(.a(p[3]),.b(p[2]),.c(p[1]),.d(p[0]),.e(ci),.y(w3_co));// p[3] & p[2] & p[1] & p[0] & ci
	_or5 co_or5(.a(g[3]),.b(w0_co),.c(w1_co),.d(w2_co),.e(w3_co),.y(co));
// co = g[3]  | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & ci)
	endmodule
	
	
	
	
	