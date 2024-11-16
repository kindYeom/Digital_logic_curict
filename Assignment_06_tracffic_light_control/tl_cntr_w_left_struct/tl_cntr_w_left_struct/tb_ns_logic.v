 `timescale 1ns/100ps
 
	module tb_ns_logic;
	
	reg [2:0]tb_state;
	reg tb_Ta,tb_Tb,tb_TAL,tb_TBL;
	
	wire [2:0]nextstate;

	
	ns_logic u0_ns_logicns_logic(tb_Ta,tb_Tb,tb_TAL,tb_TBL,tb_state,nextstate);


	initial
		begin
		tb_Ta=0;tb_Tb=0;tb_TAL=0;tb_TBL=0;
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
	
