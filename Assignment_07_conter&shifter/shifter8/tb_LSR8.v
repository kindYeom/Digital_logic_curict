`timescale 1ns/100ps

	// Testbench module for LSR8 (Logical Shift Right by 8 bits)
	module tb_LSR8;
	// Inputs for testbench: 8-bit data and 2-bit shift amount
		reg [7:0] tb_d;
		reg [1:0] tb_shamt;

  // Output from the LSR8 module
		wire [7:0] tb_d_out;

  // Instantiate the LSR8 module
		LSR8 U0_LSR8(.d_in(tb_d), .shamt(tb_shamt), .d_out(tb_d_out));

  //simulation start
  initial
		begin
    // Initialize test data and shift amount
			tb_d = 31;      // 8'b00011111
			tb_shamt = 3;   // 2'b11
    
 
	#10

    // Update test data and shift amount
    tb_d = 0;       // 8'b00000000
    tb_shamt = 2;    // 2'b10

    // Wait for another 10 time units
    #10

    // Update test data and shift amount
    tb_d = 255;     // 8'b11111111
    tb_shamt = 3;   // 2'b11

    //end
    #10; $stop;
  end
endmodule

