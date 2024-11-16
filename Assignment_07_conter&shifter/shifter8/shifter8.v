module shifter8(clk, reset_n, op, shamt, d_in, d_out);
  // 8-bit shifter module with conditional control logic and register
  input clk, reset_n;  // Clock and reset signals
  input [2:0] op;      // Operator input
  input [1:0] shamt;   // Shift amount input
  input [7:0] d_in;    // 8-bit data input

  output [7:0] d_out;  // 8-bit data output

  wire [7:0] w1;  // Internal wire for intermediate data

  // Instantiate conditional control logic module
  cc_logic U0_cc_logic(op, shamt, d_in, d_out, w1);
  
  // Instantiate 8-bit register module with read operation
  _register8_r U0_register8_r(clk, reset_n, w1, d_out);
endmodule
