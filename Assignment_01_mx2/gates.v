module _inv(a,y); // inverter
input a; // inverter input a
output y;// inverter 0utput a
assign y=~a; // y = a'
endmodule 

module _nand2(a,b,y); // 2 input nand gate
input a,b; // input a, b
output y; // output a,b
assign y=~(a&b); //y = a nand b
endmodule
