module cc_logic(op, shamt, d_in, d_out, do_next);
  // Conditional Control Logic module
  // Inputs: operation (op), 2-bit shift amount (shamt), 8-bit data input (d_in), 8-bit data output (d_out)
  input [2:0] op; 
  input [1:0] shamt;
  input [7:0] d_in;
  input [7:0] d_out;
  output [7:0] do_next;  // Output for next stage
  
  reg [7:0] do_next;  // Internal signal for next stage data
  
  wire [7:0] d_lsl;   // Output from LSL8 module
  wire [7:0] d_lsr;   // Output from LSR8 module
  wire [7:0] d_asr;   // Output from ASR8 module
  
  // Operation parameters
  parameter NOP = 3'b000;
  parameter LOAD = 3'b001;
  parameter LSL = 3'b010;
  parameter LSR = 3'b011;
  parameter ASR = 3'b100;
  
  // Conditional assignment based on operation type
  always @(op, shamt, d_in, d_out, d_lsl, d_lsr, d_asr)
  begin
    case(op)
      NOP: begin
        do_next = d_out; 
      end
      LOAD: begin
        do_next = d_in; 
      end
      LSL: begin
        do_next = d_lsl; 
      end
      LSR: begin
        do_next = d_lsr; 
      end
      ASR: begin
        do_next = d_asr; 
      end
    endcase
  end

  // Instantiate shift modules and connect outputs to internal wires
  LSL8 U0_lsl8(.d_in(d_out), .shamt(shamt), .d_out(d_lsl));
  LSR8 U1_lsr8(.d_in(d_out), .shamt(shamt), .d_out(d_lsr));
  ASR8 U2_asr8(.d_in(d_out), .shamt(shamt), .d_out(d_asr));

endmodule
