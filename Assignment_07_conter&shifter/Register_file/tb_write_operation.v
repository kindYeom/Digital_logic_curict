`timescale 1ns/100ps

module tb_write_operation;

	reg we;
	reg [2:0] Addr;
	wire [7:0] to_reg;

	write_operation U0_write_operation(Addr, we, to_reg);

		always begin
		
		#5 we = ~we;
		end

  initial begin
	we = 0;
	Addr = 0;
	#10
		Addr = 1;
	#10
		Addr = 2;
	#10
		Addr = 3;
	#10
		Addr = 4;
	#10
		Addr = 5;
	#10
		Addr = 6;
	#10
		Addr = 7;
	#10
	
	#10 $stop;
	
	

  end

endmodule
