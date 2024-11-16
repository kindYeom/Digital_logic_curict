module _3_to_8_decoder (d, q);
  // 3-to-8 decoder module
  // Inputs: 3-bit data (d)
  // Outputs: 8-bit active-low decoded signals (q)

  input [2:0] d; // 3-bit input data
  output reg [7:0] q; // 8-bit active-low decoded outputs

  always @(d) begin
    case (d)
      3'b000: q = 8'b00000001;
      3'b001: q = 8'b00000010;
      3'b010: q = 8'b00000100;
      3'b011: q = 8'b00001000;
      3'b100: q = 8'b00010000;
      3'b101: q = 8'b00100000;
      3'b110: q = 8'b01000000;
      3'b111: q = 8'b10000000;
      default: q = 8'hx; // Set to 'x' for unknown or unassigned state
    endcase
  end
endmodule
