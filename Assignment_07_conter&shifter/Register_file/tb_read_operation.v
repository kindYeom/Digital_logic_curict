`timescale 1ns/100ps

module tb_read_operation;
	reg [31:0] from_reg0, from_reg1, from_reg2, from_reg3, from_reg4, from_reg5, from_reg6, from_reg7; // Data from registers
	reg [2:0] Addr; // Address for selecting data from registers
	wire [31:0] Data; // Data output based on the selected address
	
	read_operation tb_read_operation(Addr, Data, from_reg0, from_reg1, from_reg2, from_reg3, from_reg4, from_reg5, from_reg6, from_reg7);
  
	always begin
	
	#10 Addr = Addr + 1;
	
	end

  initial begin
 
  from_reg0 <= 1;
  from_reg1 <= 2;
  from_reg2 <= 3;
  from_reg3 <= 4;
  from_reg4 <= 5;
  from_reg5 <= 6;
  from_reg6 <= 7;
  from_reg7 <= 8;
	#11
	Addr  = 0;

  #80 $stop;

  end

endmodule
