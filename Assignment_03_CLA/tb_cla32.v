`timescale 1ns/100ps

module tb_cla32;
	reg [31:0] tb_a, tb_b; 
	reg tb_ci;
	wire [31:0] tb_s;
	wire tb_co;
	wire [31:0] tb_result;
	wire tb_result_co;

	assign tb_result = {tb_s};
	assign tb_result_co = {tb_co};
	cla32 U0_cla32(.a(tb_a), .b(tb_b), .ci(tb_ci), .s(tb_s), .co(tb_co));
	initial
		begin
		tb_a = 32'h0; tb_b = 32'h0; tb_ci = 0;
		#10; tb_a = 32'hffff_ffff; tb_b = 32'h0000_0000; // No carry, all sum = 15
		#10; tb_a = 32'h0000_0000; tb_b = 32'h2fff_ffff; tb_ci = 1; // All carry, all sum = 0
		#10; tb_a = 32'haaaa_aaaa; tb_b = 32'h5555_5555; tb_ci = 0;// A: 1010... / B: 0101...
		#10; tb_a = 32'h8000_0000; tb_b = 32'h8000_0000; // Overflow test signed
		#10; tb_a = 32'h7fff_ffff; tb_b = 32'h7fff_ffff; // No overflow test signed 
		#10; tb_a = 32'hffff_fffe; tb_b = 32'h0000_0001; // Overflow test unsigned
		#10; tb_a = 32'h7fff_ffff; tb_b = 32'h0000_0001; // No overflow test unsigned
		#10; tb_a = 32'h1234_5678; tb_b = 32'h9abc_def0; // Random values
		#10; tb_a = 32'hffffffff; tb_b = 32'h0000_0001; tb_ci = 1; // All ci test & overflow
		#10; $stop;
		end
endmodule
