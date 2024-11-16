module mx4(y, d0, d1, d2, d3, s);
  // 4-to-1 multiplexer module
  // Inputs: 4 data inputs (d0, d1, d2, d3), 2-bit (s)
  input d0;
  input d1;
  input d2;
  input d3;
  input [1:0] s; // 2-bit select signal
  
  // Output - multiplexer
  output y;
  
	// wire mx2 - mx2
	wire w1, w2;
  
  // Instantiate two 2-to-1 for mx2
  mx2 U0_mx2(d0, d1, s[0], w1); // Multiplexes d0 and d1 based on s[0]
  mx2 U1_mx2(d2, d3, s[0], w2); // Multiplexes d2 and d3 based on s[0]
  
  // Instantiate another 2-to-1 multiplexer for the final output
  mx2 U2_mx2(w1, w2, s[1], y); // Multiplexes w1 and w2 based on s[1] to produce the final output y
endmodule
