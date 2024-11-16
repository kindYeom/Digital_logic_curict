module mux2(
    input d0, d1, s,
    output reg y // Output y
);

    // Inputs: d0, d1 (data inputs), s (select signal)
    // Output: y (output data)

    // Multiplexer logic to select between d0 and d1 based on select signal s
    always @* begin
        if (s == 0) begin
            y = d0; // Output d0 when select signal s is 0
        end
        else begin
            y = d1; // Output d1 when select signal s is not 0
        end
    end

endmodule
