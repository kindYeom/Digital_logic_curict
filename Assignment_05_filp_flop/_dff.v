module _dff(clk, d, q, q_bar);
    input clk, d;
    output q, q_bar;
    wire clk_bar, intermediate_q;

    // Invert the clock signal
    _inv U0_inv(.a(clk), .y(clk_bar));

    // Use inverted clock signal to create output
    _dlatch U0_dlatch(.clk(clk_bar), .d(d), .q(intermediate_q), .q_bar());

    // Use the original clock signal and output to get final outputs q and q_bar
    _dlatch U1_dlatch(.clk(clk), .d(intermediate_q), .q(q), .q_bar(q_bar));
endmodule

