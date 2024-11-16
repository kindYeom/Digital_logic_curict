module os_logic (state, d_in, d_out);
  // Output logic module based on the current state
  parameter IDLE_STATE = 3'b000;
  parameter LOAD_STATE = 3'b001;
  parameter INC_STATE = 3'b010;
  parameter INC2_STATE = 3'b011;
  parameter DEC_STATE = 3'b100;
  parameter DEC2_STATE = 3'b101;

  input [2:0] state;     // Current state input
  input [7:0] d_in;      // 8-bit data input

  output reg [7:0] d_out; // 8-bit data output

  wire [7:0] d_inc;     // Incremented data (for INC_STATE and INC2_STATE)
  wire [7:0] d_dec;     // Decremented data (for DEC_STATE and DEC2_STATE)

  always @(state, d_in) begin
    case(state)
      IDLE_STATE : d_out <= 8'h00;        // Output 0 in IDLE_STATE
      LOAD_STATE : d_out <= d_in;         // Output the input data in LOAD_STATE
      INC_STATE  : d_out <= d_inc;        // Output incremented data in INC_STATE
      INC2_STATE : d_out <= d_inc;        // Output incremented data in INC2_STATE
      DEC_STATE  : d_out <= d_dec;        // Output decremented data in DEC_STATE
      DEC2_STATE : d_out <= d_dec;        // Output decremented data in DEC2_STATE
      default    : d_out = 8'hxx;         // Output undefined data in other states
    endcase
  end

  // Instances of CLA (Carry Look-Ahead) modules for increment and decrement operations
  cla8 U1_cla8(d_out, 8'b00000001, 8'b00000000, d_inc); // Increment by 1
  cla8 U2_cla8(d_out, 8'b11111111, 8'b00000000, d_dec); // Decrement by 1
endmodule
