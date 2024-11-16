module _dff_en(clk, en, d, q);
    input clk, en, d;
    output q;

    wire w_d;  //mux input

    // selects input d when en is high, else holds the previous value
    mx2 U0_mx2(.y(w_d), .d0(q), .d1(d), .s(en));

    // d flip-flop update output q on clock rising edge with the selected input w_d
    _dff U1_dff (.clk(clk), .d(w_d), .q(q));
endmodule
