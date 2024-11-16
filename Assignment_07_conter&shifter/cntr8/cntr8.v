module cntr8(clk, reset_n, inc, load, d_in, d_out, o_state);
  // 8-bit counter module with control inputs and state output
  input clk, reset_n, inc, load;   // Clock, active-low reset, increment, and load inputs
  input [7:0] d_in;                // 8-bit data input
  output [7:0] d_out;              // 8-bit data output
  
  output [2:0] o_state;            // Output representing the current state
  wire [2:0] next_state;           // Internal wire for next state calculation
  wire [2:0] state;                // Internal wire representing the current state

  assign o_state = state;          // Output the current state

  // Instantiate register, next state logic, and output logic modules
  _register3_r U0_register3_r(clk, reset_n, next_state, state);
  ns_logic U0_ns_logic(load, inc, state, next_state);
  os_logic U0_os_logic(state, d_in, d_out);
endmodule
