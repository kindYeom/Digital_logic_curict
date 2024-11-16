module _inv(a,y);//inverter
input a;// input a
output y; // output y
assign y=~a; // y =   inverse a
endmodule

module _or2(a,b,y);//2 input or gate
input a,b; // input a,b
output y; // output y
assign y=a|b; // y = a or b
endmodule

module _nand2(a,b,y);//2input nand gate
input a,b; // input a ,b
output y; // output y
assign y=~(a&b);// a nand b
endmodule

module _xor2(a,b,y);// 2input xor gate
input a, b; // input a, b
output y; // output y
wire inv_a, inv_b; // inv_a : wire U0_inv - U2_and2, inv_b : wire U1_inv - U3_and2
wire w0, w1;//w0 : U2_and2 - U4_or2, w1 : U3_and2 - U4_or2
_inv U0_inv(.a(a), .y(inv_a)); //inv_a = not a
_inv U1_inv(.a(b), .y(inv_b)); //inv_a = not a
_and2 U2_and2(.a(inv_a), .b(b), .y(w0)); // W0 = not a AND b
_and2 U3_and2(.a(a),.b(inv_b), .y(w1)); // w1 = a AND not b
_or2 U4_or2(.a(w0), .b(w1),.y(y)); // output y = w0 OR w1
endmodule


module _and2(a,b,y);// 2input and gate
input a,b;// input a,b
output y; // output y
assign y=a&b; // y = a AND b
endmodule// end module

