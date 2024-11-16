`timescale 1ns/100ps

// Testbench module for LSL8 
module tb_LSL8;
  // Testbench inputs: 8-bit data tb_d, 2-bit shift amount tb_shamt
  reg [7:0] tb_d;
  reg [1:0] tb_shamt;
  
  // Testbench output: 8-bit data (tb_d_out)
  wire [7:0] tb_d_out;
  
  // Instantiate the LSL8 module with testbench inputs and outputs
  LSL8 U0_LSL8(.d_in(tb_d), .shamt(tb_shamt), .d_out(tb_d_out));
 
  initial
  begin
    //set data and shift amount
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
    
    // Wait for 10 end
    #10; $stop;
  end
endmodule
