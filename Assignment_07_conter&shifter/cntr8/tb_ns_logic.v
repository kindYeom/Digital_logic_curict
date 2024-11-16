`timescale 1ns/100ps

module tb_ns_logic; // Testbench for ns_logic module

  // Define states
  parameter IDLE_STATE = 3'b000;
  parameter LOAD_STATE = 3'b001;
  parameter INC_STATE = 3'b010;
  parameter INC2_STATE = 3'b011;
  parameter DEC_STATE = 3'b100;
  parameter DEC2_STATE = 3'b101;

  reg tb_load, tb_inc;  // Testbench inputs: load and increment signals
  reg [2:0] state;      // Testbench input: current state
  wire [2:0] next_state;  // Output from ns_logic module: next state

  // Instantiate ns_logic module
  ns_logic U0_ns_logic(tb_load, tb_inc, state, next_state);

  initial
  begin
    #10  // Wait for initial simulation time before starting the test
    
    // Test scenario for IDLE_STATE
    state <= IDLE_STATE;
    tb_load = 1;
    tb_inc = 0;
    #10
    tb_load = 0;
    tb_inc = 1;
    #10
    tb_load = 0;
    tb_inc = 0;
    
    // Test scenario for LOAD_STATE
    #20
    state <= LOAD_STATE;
    tb_load = 1;
    tb_inc = 0;
    #10
    tb_load = 0;
    tb_inc = 1;
    #10
    tb_load = 0;
    tb_inc = 0;
    
    // Test scenario for INC_STATE
    #20
    state <= INC_STATE;
    tb_load = 1;
    tb_inc = 0;
    #10
    tb_load = 0;
    tb_inc = 1;
    #10
    tb_load = 0;
    tb_inc = 0;
    
    // Test scenario for INC2_STATE
    #20
    state <= INC2_STATE;
    tb_load = 1;
    tb_inc = 0;
    #10
    tb_load = 0;
    tb_inc = 1;
    #10
    tb_load = 0;
    tb_inc = 0;
    
    // Test scenario for DEC_STATE
    #20
    state <= DEC_STATE;
    tb_load = 1;
    tb_inc = 0;
    #10
    tb_load = 0;
    tb_inc = 1;
    #10
    tb_load = 0;
    tb_inc = 0;
    
    // Test scenario for DEC2_STATE
    #20
    state <= DEC2_STATE;
    tb_load = 1;
    tb_inc = 1;
    #10
    tb_load = 0;
    tb_inc = 1;
    #10
    tb_load = 0;
    tb_inc = 0;
    
    #20  // Stop the simulation after all test scenarios are executed
    $stop;
  end
endmodule
