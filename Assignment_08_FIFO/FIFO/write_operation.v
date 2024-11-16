module write_operation(Addr, we, to_reg);
	input we;  // Write enable input
	input [2:0] Addr;  // Address input
	output [7:0] to_reg; // Output to register
	
	wire [7:0] w_a; // Wire for decoded address
    // 3-to-8 decoder instantiation
	_3_to_8_decoder U0_3_to_8_decoder (Addr, w_a);
	_and2 U0_and2(w_a[0],we,to_reg[0]);
	_and2 U1_and2(w_a[1],we,to_reg[1]);
	_and2 U2_and2(w_a[2],we,to_reg[2]);
	_and2 U3_and2(w_a[3],we,to_reg[3]);
	
	_and2 U4_and2(w_a[4],we,to_reg[4]);
	_and2 U5_and2(w_a[5],we,to_reg[5]);
	_and2 U6_and2(w_a[6],we,to_reg[6]);
	_and2 U7_and2(w_a[7],we,to_reg[7]);



endmodule
