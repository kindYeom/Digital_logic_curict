`timescale 1ns/100ps

module tb_os_logic;

  // Define states
  parameter IDLE_STATE = 3'b000;
  parameter LOAD_STATE = 3'b001;
  parameter INC_STATE = 3'b010;
  parameter INC2_STATE = 3'b011;
  parameter DEC_STATE = 3'b100;
  parameter DEC2_STATE = 3'b101;

  reg [2:0] tb_state;    // Testbench input: current state
  reg [7:0] tb_d_in;     // Testbench input: input data
  wire [7:0] tb_d_out;   // Output from os_logic module: output data

  // Instantiate os_logic module
  os_logic U0_os_logic(.state(tb_state), .d_in(tb_d_in), .d_out(tb_d_out));

  initial
  begin
    #10   // Wait for initial simulation time before starting the test
    
    // Test scenario for IDLE_STATE
    tb_d_in = 8'b11111111;
    #10
    
    tb_state <= IDLE_STATE;
    #10

    // Test scenario for LOAD_STATE
    #20
    tb_state <= LOAD_STATE;

    // Test scenario for INC_STATE
    #20
    tb_state <= INC_STATE;

    // Test scenario for INC2_STATE
    #20
    tb_state <= INC2_STATE;

    // Test scenario for DEC_STATE
    #20
    tb_state <= DEC_STATE;

    // Test scenario for DEC2_STATE
    #20
    tb_state <= DEC2_STATE;

    #20  // Stop the simulation after all test scenarios are executed
    $stop;
  end
endmodule
