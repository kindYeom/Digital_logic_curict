`timescale 1ns/100ps

// Testbench module for ASR8 
module tb_ASR8;
  // Testbench inputs: 8-bit data (tb_d), 2-bit shift amount (tb_shamt)
  reg [7:0] tb_d;   // 8-bit input data
  reg [1:0] tb_shamt;   // 2-bit shift amount
  
  // Testbench output: 8-bit shifted data (tb_d_out)
  wire [7:0] tb_d_out;   // Output from ASR8 module
  
  // Instantiate the ASR8 module
  ASR8 U0_ASR8(.d_in(tb_d), .shamt(tb_shamt), .d_out(tb_d_out));
  
  // Initial block for simulation
  initial
  begin
    // Initialize test data and shift amount
    tb_d = 31;       // 8'b00011111
    tb_shamt = 3;    // 2'b11
    
    // Wait for 10 time units
    #10
    
    // Update test data and shift amount
    tb_d = 0;        // 8'b00000000
    tb_shamt = 2;     // 2'b10
    
    // Wait for another 10 time units
    #10
    
    // Update test data and shift amount
    tb_d = 255;      // 8'b11111111
    tb_shamt = 3;    // 2'b11
    
    // Wait for 10 time units
    #10
    
    // Update test data and shift amount (testing negative number)
    tb_d = -16;      // 8'b11110000 
    tb_shamt = 3;    // 2'b11
    
    // 
    #10; $stop;
  end
endmodule
