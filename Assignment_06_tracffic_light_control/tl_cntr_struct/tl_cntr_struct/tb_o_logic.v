 `timescale 1ns/100ps
 
	module tb_o_logic;
	
	reg [1:0]state;
	wire [1:0]La,Lb;
	
	o_logic u0_ologic(state,La,Lb);
	
	
	initial
		begin
		state = 0;#10
		state = 1;#10
		state = 2;#10
		state = 3;#10
		
		$stop;
	end
	endmodule
	
