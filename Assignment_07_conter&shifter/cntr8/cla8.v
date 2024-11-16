module cla8(a, b, ci, s, co);
  // 8-bit Carry Look-Ahead Adder module
  input [7:0] a, b; // 8-bit inputs a and b
  input ci;          // Carry input
  output [7:0] s;    // 8-bit sum output
  output co;         // Carry output

  wire c1;           // Intermediate carry wire

  // Instantiate two 4-bit CLA modules to compute the sum
  cla4 U0_cla4(.a(a[3:0]), .b(b[3:0]), .ci(ci), .s(s[3:0]), .co(c1));
  cla4 U1_cla4(.a(a[7:4]), .b(b[7:4]), .ci(c1), .s(s[7:4]), .co(co));
endmodule
