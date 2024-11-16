`timescale 1ns/100ps

// Testbench module for mx4 (4-to-1 multiplexer)
module tb_mx4;
  reg [3:0] d; // 4-bit data input
  reg [1:0] tb_s; // 2-bit select input
  wire tb_y; // Output of the 4-to-1 multiplexer

  // Instantiate the mx4 module with testbench inputs and output
  mx4 U_mx4(.y(tb_y), .d0(d[0]), .d1(d[1]), .d2(d[2]), .d3(d[3]), .s(tb_s));
 

  initial
  begin
   
    #10
    d = 4'b0001; // Set input data: 0001
    tb_s = 2'b00; // Set select input: 00
    #10
    d = 4'b0010; // Set input data: 0010
    tb_s = 2'b01; // Set select input: 01
    #10
    d = 4'b0100; // Set input data: 0100
    tb_s = 2'b10; // Set select input: 10
    #10
    d = 4'b1000; // Set input data: 1000
    tb_s = 2'b11; // Set select input: 11
    #10
    $stop; // Stop 
  end
endmodule
