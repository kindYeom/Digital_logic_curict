module _dff_r(clk, reset_n, d, q);
    input clk, reset_n, d;
    output q;

    wire w_d;  // AND gate input

    // AND gate ensures 'd' is transferred to 'q' only when 'reset_n' is active
    _and2 U0_and2(.a(d), .b(reset_n), .y(w_d));

    // D Flip-Flop updates output 'q' on clock rising edge with the AND gate output
    _dff U1_dff(.clk(clk), .d(w_d), .q(q));
endmodule

