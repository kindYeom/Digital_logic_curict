`timescale 1ns/100ps

module tb_cntr;

  // Define states
  parameter IDLE_STATE = 3'b000;
  parameter LOAD_STATE = 3'b001;
  parameter INC_STATE = 3'b010;
  parameter INC2_STATE = 3'b011;
  parameter DEC_STATE = 3'b100;
  parameter DEC2_STATE = 3'b101;

  // Testbench inputs and outputs
  reg tb_reset_n, tb_clk, tb_inc, tb_load;
  reg [7:0] tb_d_in;
  wire [7:0] tb_d_out;
  wire [2:0] tb_o_state;
  
  // Instantiate cntr8 module
  cntr8 U0_cntr8(.clk(tb_clk), .reset_n(tb_reset_n), .inc(tb_inc), .load(tb_load), .d_in(tb_d_in), .d_out(tb_d_out), .o_state(tb_o_state));

  // Clock generation
  always begin
    #5 tb_clk = ~tb_clk;
  end
  
  // Testbench behavior
  initial begin
    tb_d_in = 8'b11111111;
    tb_reset_n = 0;
    tb_clk = 0;
    tb_inc = 0; tb_load = 0;
    #15
    tb_clk = 0;	
    #10
    tb_reset_n = 1;
    #21
    tb_load = 1;
    #10
    tb_inc = 1;
    #0
    tb_load = 0;
    #40
    tb_reset_n = 0;
    #40 $stop;
  end
endmodule
