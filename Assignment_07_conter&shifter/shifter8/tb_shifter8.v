`timescale 1ns/100ps

// Testbench module for shifter8
module tb_shifter8;

  // Testbench inputs: clock (tb_clk), reset (tb_reset_n), operation (tb_op), shift amount (tb_shamt), data input (tb_d_in)
  reg tb_clk, tb_reset_n;
  reg [2:0] tb_op;
  reg [1:0] tb_shamt;
  reg [7:0] tb_d_in;

  // Testbench output: data output (tb_d_out)
  wire [7:0] tb_d_out;

  // Instantiate shifter8 module with testbench inputs and output
  shifter8 U0_shifter(.clk(tb_clk), .reset_n(tb_reset_n), .op(tb_op), .shamt(tb_shamt), .d_in(tb_d_in), .d_out(tb_d_out));

  // Clock generation
  always begin
    #5 tb_clk = ~tb_clk; // Toggle the clock every 5 time units
  end
  
  // Initial block for simulation
  initial begin
    // Wait for 10 time units
    #10
    tb_clk = 0; tb_reset_n = 0; tb_op = 3'b000; tb_shamt = 2'b00; tb_d_in = 8'b00000000;
    #10
    tb_reset_n = 1; // Release reset after 10 time units
    #17
    tb_op = 3'b001; tb_shamt = 2'b00; tb_d_in = 8'b01110111; // Set operation, shift amount, and input data
    #30
    tb_op = 3'b010; tb_shamt = 2'b11; // Set shift operation and shift amount
    #30
    tb_op = 3'b100; tb_d_in = 8'b10000111; // Set arithmetic shift operation and input data
    #10
    tb_op = 3'b011; // Set logical shift operation
    #10
    tb_op = 3'b00; // Set NOP operation
    #25 $stop; // Stop the simulation after 25 time units
  end
endmodule
