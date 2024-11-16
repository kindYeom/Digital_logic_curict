`timescale 1ns/100ps

module tb_cla_clk; // tb_cla_clk
	reg clk; // clock register
	reg [31:0] tb_a, tb_b; // 32bit register tb_a, tb_b
	reg tb_ci; // register cin

	wire [31:0] tb_s_cla; // register output s_cla
	wire tb_co_cla; // register for output co_clas
	
	parameter STEP = 10; // time step for clock

	cla_clk U0_cla_clk(.clk(clk), .a(tb_a), .b(tb_b), .ci(tb_ci),.s(tb_s_cla), .co(tb_co_cla));
	// cla_clk module
	always #(STEP/2) clk = ~clk;

	initial
		begin
		clk = 1'b0; //start clock value set
		tb_a = 32'h0; tb_b = 32'h0; tb_ci = 1'b0; // a,b,ci value change
		#(STEP); tb_a = 32'hFFFF_FFFF; tb_b = 32'h0; tb_ci = 1; // a,b,ci value change
		#(STEP); tb_a = 32'h0000_0000; tb_b = 32'h2fff_ffff; tb_ci = 1; // a,b,ci value change
		#(STEP); tb_a = 32'haaaa_aaaa; tb_b = 32'h5555_5555; tb_ci = 0; // a,b,ci value change
		#(STEP); tb_a = 32'h8000_0000; tb_b = 32'h8000_0000;// Overflow test signed 
		#(STEP); tb_a = 32'h7fff_ffff; tb_b = 32'h7fff_ffff;// No overflow test signed  	
		#(STEP); tb_a = 32'hffff_fffe; tb_b = 32'h0000_0001;// Overflow test unsigned
		#(STEP); tb_a = 32'h7fff_ffff; tb_b = 32'h0000_0001;// No overflow test unsigned
		#(STEP); tb_a = 32'h1234_5678; tb_b = 32'h9abc_def0;//random value
		#(STEP); $stop;

	end

	endmodule
	