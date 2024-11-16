module _8_to_1_MUX(re,a, b, c, d, e, f, g, h, sel, d_out);
  input [31:0] a, b, c, d, e, f, g, h; // Input data signals
  input [2:0] sel; // Select signal for choosing one of the inputs
  input re;
  output reg [31:0] d_out; // Output data signal
  
  always @(sel, a, b, c, d, e, f, g, h) begin
    case({sel,re}	)
      4'b0001 : d_out <= a; // Output a when sel is 3'b000
      4'b0011 : d_out <= b; // Output b when sel is 3'b001
      4'b0101 : d_out <= c; // Output c when sel is 3'b010
      4'b0111 : d_out <= d; // Output d when sel is 3'b011
      4'b1001 : d_out <= e; // Output e when sel is 3'b100
      4'b1011 : d_out <= f; // Output f when sel is 3'b101
      4'b1101 : d_out <= g; // Output g when sel is 3'b110
      4'b1111 : d_out <= h; // Output h when sel is 3'b111
      default: d_out <= 32'hx; // Output 'x' if sel is not within valid range
    endcase
  end
endmodule
