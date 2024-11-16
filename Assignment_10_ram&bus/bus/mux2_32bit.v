module mux2_32bit(
    input [31:0] d0, d1, // 32-bit data inputs
    input s, // Select signal
    output reg[31:0] y // 32-bit output y
);


    always @* begin
        if (s == 0) begin
            y = d0; // Output y is d0 when select signal s is 0
        end
        else begin
            y = d1; // Output y is d1 when select signal s is not 0
        end
    end

endmodule
