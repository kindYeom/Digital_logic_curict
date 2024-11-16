`timescale 1ns/100ps
module tb_cla4;
reg [3:0] tb_a, tb_b; 
reg tb_ci;
wire [3:0] tb_s;
wire tb_co;
wire [4:0] tb_result;
assign tb_result = {tb_co, tb_s};
cla4 U0_cla4(.a(tb_a), .b(tb_b), .ci(tb_ci), .s(tb_s), .co(tb_co));
initial
begin
tb_a=4'b0; tb_b=4'b0; tb_ci=0;
#10; tb_a=4'b0000; tb_b=4'b1111; // a:0000 b:1111 to check result S 
#10; tb_a=4'b0001; tb_b=4'b0001; // a: 0001 b:0001 to check cout cla0 - cin cla 1
#10; tb_a=4'b0010; tb_b=4'b0011;// a: 0001 b:0001 to check cout cla1 - cin cla 2 
#10; tb_a=4'b0111; tb_b=4'b0111;// a: 0111 b:0111 to check cout cla2 - cin cla 3 
#10; tb_a=4'b1111; tb_b=4'b1111;// ;// a: 1111 b:1111 to check 4bit cla cout  
#10; tb_ci=1; // ci = 1 all cla moudle has carry out
#10; $stop;

end
endmodule
