module LSR8(d_in, shamt, d_out);
  // 8-bit Logical Shift Right (LSR) module
  // Inputs: 8-bit data input (d_in), 2-bit shift amount (shamt)
  input [7:0] d_in;   // 8-bit input data
  input [1:0] shamt;   // 2-bit shift amount
  
  // Output: 8-bit shifted data output (d_out)
  output [7:0] d_out;  // Output from LSR8 module
  
  // Instantiate 4-to-1 multiplexers (mx4) for each bit position
  // Shift the input data right by the specified shift amount
  mx4 U0_mx4(.y(d_out[7]), .d0(d_in[7]), .d1(0), .d2(0), .d3(0), .s(shamt));
  mx4 U1_mx4(.y(d_out[6]), .d0(d_in[6]), .d1(d_in[7]), .d2(0), .d3(0), .s(shamt));
  mx4 U2_mx4(.y(d_out[5]), .d0(d_in[5]), .d1(d_in[6]), .d2(d_in[7]), .d3(0), .s(shamt));
  mx4 U3_mx4(.y(d_out[4]), .d0(d_in[4]), .d1(d_in[5]), .d2(d_in[6]), .d3(d_in[7]), .s(shamt));
  mx4 U4_mx4(.y(d_out[3]), .d0(d_in[3]), .d1(d_in[4]), .d2(d_in[5]), .d3(d_in[6]), .s(shamt));
  mx4 U5_mx4(.y(d_out[2]), .d0(d_in[2]), .d1(d_in[3]), .d2(d_in[4]), .d3(d_in[5]), .s(shamt));
  mx4 U6_mx4(.y(d_out[1]), .d0(d_in[1]), .d1(d_in[2]), .d2(d_in[3]), .d3(d_in[4]), .s(shamt));
  mx4 U7_mx4(.y(d_out[0]), .d0(d_in[0]), .d1(d_in[1]), .d2(d_in[2]), .d3(d_in[3]), .s(shamt));
endmodule