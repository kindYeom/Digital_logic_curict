`timescale 1ns/100ps

module tb_Register_file;
  // Testbench for Register_file Module

  reg clk, reset_n, we; // Clock, Reset, Write Enable signals
  reg [2:0] wAddr, rAddr; // Write and Read Addresses
  reg [31:0] wData; // Write Data

  wire [31:0] rData; // Read Data

  Register_file U0_Register_file(clk, reset_n, wAddr, wData, we, rAddr, rData);

  always begin
    #5 clk = ~clk;
  end

  initial begin
    we = 1; // Enable write operation
    clk = 0;
    reset_n = 0;
    we = 0;
    #10
    wAddr = 0; // Set write address to 0
    wData = 8; // Write data 8 bits wide
    #20
    reset_n = 1; // Release reset
    wAddr = 1; // Set write address to 1
    #10
    wAddr = 2; // Set write address to 2
    wData = 2; // Write data 2 bits wide
    #10
    we = 0; // Disable write operation
    wAddr = 3; // Set write address to 3
    wData = 3; // Write data 3 bits wide
    #10
    wAddr = 4; // Set write address to 4
    wData = 4; // Write data 4 bits wide
    we = 1; // Enable write operation
    #10
    wAddr = 5; // Set write address to 5
    wData = 5; // Write data 5 bits wide
    #10
    wAddr = 6; // Set write address to 6
    wData = 6; // Write data 6 bits wide
    #10
    wAddr = 7; // Set write address to 7
    wData = 7; // Write data 7 bits wide

    #10 rAddr = 0; // Set read address to 0
    #10 rAddr = 1; // Set read address to 1
    #10 rAddr = 2; // Set read address to 2
    #10 rAddr = 3; // Set read address to 3
    #10 rAddr = 4; // Set read address to 4
    #10 rAddr = 5; // Set read address to 5
    #10 rAddr = 6; // Set read address to 6
    #10 rAddr = 7; // Set read address to 7
    $stop; // Stop simulation
  end

endmodule
