	`timescale 1ns/100ps

module tb_fa; // fulladder tb
reg a, b, ci; // reg a, b, ci for input
wire s, co; // wire s, co for output

fa u0_fa(a,b,ci,s,co); // full adder u0_fa
		
initial
begin
a=0;b=0;ci=0; // set all input 0
#10 a=1; // set a = 1 then s=1 co = 0
#10 b=1; // set b = 1 then s  = 0 co =1
#10 ci=1; // set a = 1 then s=1 co = 1
#10;
end
endmodule
