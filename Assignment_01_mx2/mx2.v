module mx2(d0,d1,s,y); // 2-t0-1 mux
input d0,d1,s;// input d0,d1,s
output y;//output y
wire w0,w1,sb; //wire w0: nd20 - nd22, w1: nd21 - nd22, w2: nd22 - Y

_inv iv0(.a(s),.y(sb)); // inverter S
_nand2 nd20(.a(d0),.b(sb),.y(w0)); // w0 = inverter S nand d0
_nand2 nd21(.a(d1),.b(s),.y(w1));// w1 =  S nand d0
_nand2 nd22(.a(w0),.b(w1),.y(y)); // w2 = w0 nand w1
   

endmodule
