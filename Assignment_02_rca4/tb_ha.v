`timescale 1ns/100ps
module tb_ha;// half adder tb
reg a,b; // input a ,b reg
wire s;// output s
wire co;// output co
ha U0_ha(.a(a), .b(b), .s(s), .co(co));
initial
begin
a=1'b0; b=1'b0; // a, b =0
#10 a=1'b0; b=1'b1;// a=0 b=1 then s=1 co =0
#10 a=1'b1; b=1'b0;// a=1 b=0 then s=1 co =0
#10 a=1'b1; b=1'b1;// a=` b=1 then s=0 co =1
#10 $stop;
end
endmodule
