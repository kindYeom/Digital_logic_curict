module Register_file(clk, reset_n, wAddr, wData, we, rAddr, rData,re);
  // Register File module
  // Inputs: clock (clk), active-low asynchronous reset (reset_n),
  //         write address (wAddr), write data (wData), write enable (we),
  //         read address (rAddr)
  // Outputs: 32-bit data output (rData)

	input clk, reset_n, we;
	input [2:0] wAddr, rAddr;
	input [31:0] wData;
	output [31:0] rData;
	input re;
	wire [7:0] to_reg;  // Write data input to the register file
	wire [31:0] from_reg[7:0];  // Data outputs from the register file

	// Instance of register32_8, write_operation, read_operation
	register32_8 U0_register32_8(clk, reset_n, to_reg, wData, from_reg[0], from_reg[1], from_reg[2], from_reg[3], from_reg[4], from_reg[5], from_reg[6], from_reg[7]);
	write_operation U0_write_operation(wAddr, we, to_reg);  // Write operation module
	read_operation U0_read_operation(re,rAddr, rData, from_reg[0], from_reg[1], from_reg[2], from_reg[3], from_reg[4], from_reg[5], from_reg[6], from_reg[7]);  // Read operation module
endmodule
