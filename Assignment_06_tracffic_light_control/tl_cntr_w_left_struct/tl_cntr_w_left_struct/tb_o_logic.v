 `timescale 1ns/100ps
 
	module tb_o_logic;
	
	reg [2:0]tb_state;
	wire [1:0]la,lb;
	
	


	
	o_logic u0_o_logic(tb_state,la,lb);


	initial
		begin
		
		tb_state = 0;#10
		tb_state = 1;#10
		tb_state = 2;#10
		tb_state = 3;#10
		tb_state = 4;#10
		tb_state = 5;#10
		tb_state = 6;#10
		tb_state = 7;#10
		
	
		
		
		$stop;
	end
	endmodule
	
