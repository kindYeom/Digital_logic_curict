`timescale 1ns/100ps
 
module tb_mx2;

	reg tb_d0,tb_d1,tb_s; // input d0, d1, S
	wire tb_y; // output Y

	
	mx2 u0_mx2(tb_d0,tb_d1,tb_s,tb_y); //
	
	initial begin
	 tb_d0=1; tb_d1=0; tb_s=0;
	 #10; tb_d0=1; tb_d1=0; tb_s=1; // change S
	 #10; tb_d0=0; tb_d1=1; tb_s=1;// change d1, d0
	 #10;
	end
	
endmodule
	
