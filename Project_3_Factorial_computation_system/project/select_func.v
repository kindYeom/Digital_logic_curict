module select_func(
    mulr, mulc, result, count, op_start, next_mulr, next_result, next_count
);
    input [64:0] mulr;
    input [63:0] mulc;
    input [127:0] result;
    input op_start;
    input wire [63:0] count;

    output reg [64:0] next_mulr;
    output reg [127:0] next_result;
    output reg [63:0] next_count;
    reg [1:0] lower_bit;

    reg [63:0] mulc_m;
    wire [63:0] mult;
    reg y;

    cla64 U0_cla64(
        .a(result[127:64]),
        .b(mulc_m),
        .ci(y),
        .s(mult),
        .co()
    );

    always @(*) begin
        lower_bit = mulr[1:0];

        if (count == 0) begin
            // No operation
            next_result = result;
            next_mulr = mulr;
        end else if (op_start == 0) begin
            // Operation not started yet
            next_result = result;
            next_mulr = mulr;
            next_count = count;
        end else begin
            // Operation in progress

            // Doubling count and halving mulr
            next_count = count << 1;
            next_mulr = mulr >> 1;

            // Switch case based on lower two bits of mulr
            case(lower_bit)
                2'b00: begin//case shift
                    y = 1'b0;
                    next_result = result >>> 1;
                    next_result[127] = next_result[126];
                end
                2'b11: begin//case shift
                    y = 1'b0;
                    next_result = result >>> 1;
                    next_result[127] = next_result[126];
                end
                2'b01: begin//case add
                    y = 1'b0;
                    mulc_m = mulc;
                    next_result[63:0] = result[63:0];
                    next_result[127:64] = mult;
                    next_result = next_result >>> 1;
                    next_result[127] = next_result[126];
                end
                2'b10: begin//case sub
                    y = 1'b1;
                    mulc_m = ~mulc;
                    next_result[63:0] = result[63:0];
                    next_result[127:64] = mult;
                    next_result = next_result >>> 1;
                    next_result[127] = next_result[126];
                end
                default: begin
                    // Default case
                    next_result = result;
                    next_mulr = mulr;
                end
            endcase
        end
    end
endmodule
