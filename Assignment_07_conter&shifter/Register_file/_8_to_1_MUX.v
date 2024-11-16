module _8_to_1_MUX(a, b, c, d, e, f, g, h, sel, d_out);
  input [31:0] a, b, c, d, e, f, g, h; // Input data signals
  input [2:0] sel; // Select signal for choosing one of the inputs
  output reg [31:0] d_out; // Output data signal
  
  always @(sel, a, b, c, d, e, f, g, h) begin
    case(sel)
      3'b000 : d_out <= a; // Output a when sel is 3'b000
      3'b001 : d_out <= b; // Output b when sel is 3'b001
      3'b010 : d_out <= c; // Output c when sel is 3'b010
      3'b011 : d_out <= d; // Output d when sel is 3'b011
      3'b100 : d_out <= e; // Output e when sel is 3'b100
      3'b101 : d_out <= f; // Output f when sel is 3'b101
      3'b110 : d_out <= g; // Output g when sel is 3'b110
      3'b111 : d_out <= h; // Output h when sel is 3'b111
      default: d_out <= 32'hx; // Output 'x' if sel is not within valid range
    endcase
  end
endmodule
