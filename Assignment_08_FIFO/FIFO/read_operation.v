module read_operation(re,Addr, Data, from_reg0, from_reg1, from_reg2, from_reg3, from_reg4, from_reg5, from_reg6, from_reg7);
  // Read Operation Module
  // Inputs: Register Data (from_reg0 to from_reg7), Address (Addr)
  // Output: Data output (Data)

  input [31:0] from_reg0, from_reg1, from_reg2, from_reg3, from_reg4, from_reg5, from_reg6, from_reg7; // Data from registers
  input [2:0] Addr; // Address for selecting data from registers
  input re;
  output [31:0] Data; // Data output based on the selected address
  
  // Instantiate 8-to-1 MUX to select data based on the address
  _8_to_1_MUX U0_8_to_1_MUX(re,from_reg0, from_reg1, from_reg2, from_reg3, from_reg4, from_reg5, from_reg6, from_reg7, Addr, Data);	
endmodule
