`timescale 1ns/100ps
module tb_rca4; // rca moudle
reg[3:0] tb_a, tb_b;// 4bit reg tb_a, tb_b for rca4 a, b
reg tb_ci;// first rca ci 
wire[3:0] tb_s;// 4 bit rcas tb_s
wire tb_co;// rca 4bit cout 
rca4 U0_rca(.a(tb_a), .b(tb_b), .ci(tb_ci), .s(tb_s), .co(tb_co)); // rca module U0_rca
initial
begin
tb_a=4'b0; tb_b=4'b0; tb_ci=0;
#10; tb_a=4'b0000; tb_b=4'b1111; // a:0000 b:1111 to check result S 
#10; tb_a=4'b0001; tb_b=4'b0001; // a: 0001 b:0001 to check cout rca0 - cin rca 1
#10; tb_a=4'b0010; tb_b=4'b0011;// a: 0001 b:0001 to check cout rca1 - cin rca 2 
#10; tb_a=4'b0111; tb_b=4'b0111;// a: 0111 b:0111 to check cout rca2 - cin rca 3 
#10; tb_a=4'b1111; tb_b=4'b1111;// ;// a: 1111 b:1111 to check 4bit rca cout  
#10; tb_ci=1; // ci = 1 all rca moudle has carry out
#10; $stop;
end
endmodule
	