module mux3_32bit(
    input reset_n,
    input [31:0] d0, d1, d2,
    input [1:0] s,
    output reg[31:0] y
);



    always @* begin
        if (!reset_n)
            y = 32'b0; // Output y is 0 when reset is active
        else begin
            case(s)
                2'b00: y = d0; // Output y is d0 when s is 2'b00
                2'b01: y = d1; // Output y is d1 when s is 2'b01
                2'b10: y = d2; // Output y is d2 when s is 2'b10
                default: ; // Output y remains unchanged for other values of s
            endcase
        end
    end

endmodule
