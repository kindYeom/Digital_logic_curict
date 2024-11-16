`timescale 1ns/100ps

module tb_rca_clk;// testbench for rca_clk
	reg clk; // clock 
	reg [31:0] tb_a, tb_b; // 32bit reg tb_a, tb_b
	reg tb_ci; // reg ci
	wire [31:0] tb_s; // 32bit reg tb_s
	wire tb_co;// reg cout

	parameter STEP = 10; // time step clk

	rca_clk U0_rca_clk(.clk(clk), .a(tb_a), .b(tb_b), .ci(tb_ci), .s(tb_s), .co(tb_co));

	always # (STEP/2) clk = ~clk;

		initial
	begin
		clk = 1'b0; // Initialize clk to 1
		tb_a = 32'h0; tb_b = 32'h0; tb_ci = 1'b0; // first vlaue setting
		#(STEP); tb_a = 32'hFFFF_FFFF; tb_b = 32'h0; tb_ci = 1; // a,b,ci value change
		#(STEP); tb_a = 32'h0000_0000; tb_b = 32'h2fff_ffff; tb_ci = 1; // a,b,ci value change
		#(STEP); tb_a = 32'haaaa_aaaa; tb_b = 32'h5555_5555; tb_ci = 0; // a,b,ci value change
		#(STEP); tb_a = 32'h8000_0000; tb_b = 32'h8000_0000;// Overflow test signed 
		#(STEP); tb_a = 32'h7fff_ffff; tb_b = 32'h7fff_ffff;// No overflow test signed  	
		#(STEP); tb_a = 32'hffff_fffe; tb_b = 32'h0000_0001;// Overflow test unsigned
		#(STEP); tb_a = 32'h7fff_ffff; tb_b = 32'h0000_0001;// No overflow test unsigned
		#(STEP); tb_a = 32'h1234_5678; tb_b = 32'h9abc_def0;// ramdom value
		#(STEP*2); $stop;// stop
	end
	
endmodule
