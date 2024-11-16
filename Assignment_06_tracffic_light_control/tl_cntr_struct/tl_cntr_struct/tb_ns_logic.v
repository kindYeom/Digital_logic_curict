 `timescale 1ns/100ps
 
	module tb_ns_logic;
	
	reg [1:0]tb_state;
	reg tb_Ta,tb_Tb;
	
	wire [1:0]nextstate;

	
	ns_logic u0_ns_logic(.TA(tb_Ta),.TB(tb_Tb),.state(tb_state),.next_state(nextstate));


	initial
		begin
		tb_Ta=1;tb_Tb=1;
		tb_state = 0;#10
		tb_Tb=0;#10
		tb_Ta=0;#10
		
		
		tb_Ta=1;tb_Tb=1;
		tb_state=1;#10
		tb_Tb=0;#10
		tb_Ta=0;#10
		
		
		tb_Ta=1;tb_Tb=1;
		tb_state=3;#10
		tb_Tb=0;#10
		tb_Ta=0;#10	
		
		tb_Ta=1;tb_Tb=1;
		tb_state = 2;#10
		tb_Tb=0;#10
		tb_Ta=0;#10		
		
		
		
		$stop;
	end
	endmodule
	
