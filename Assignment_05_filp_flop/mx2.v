module mx2(d0, d1, s, y);
    input d0, d1;
    input s;
    output y;

    // Create inverted selection signal
    wire sb;
    _inv U0_inv(.a(s), .y(sb));

    // Create AND gates for inputs
    _nand2 U1_nand2(.a(d0), .b(sb), .y(y));
    _nand2 U2_nand2(.a(d1), .b(s), .y(y));

endmodule
