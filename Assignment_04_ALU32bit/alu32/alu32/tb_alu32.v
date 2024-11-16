 `timescale 1ns/100ps

module tb_alu32;
    reg [31:0] tb_a, tb_b;
    reg [2:0] tb_op;
    wire [31:0] tb_result;
    wire tb_c, tb_n, tb_z, tb_v;

    alu32 U0_alu32(.a(tb_a), .b(tb_b), .op(tb_op), .result(tb_result), .c(tb_c), .n(tb_n), .z(tb_z), .v(tb_v));

    initial begin
        // Test cases
        tb_a = 32'h0000_0000; tb_b = 32'h0000_0000; tb_op = 3'b000; #10; // not A
        tb_a = 32'hff00_0000; #10; // a change
        tb_b = 32'h0000_0011; tb_op = 3'b001; #10; // not B
        tb_a = 32'h0000_0101; tb_b = 32'h0000_1001; tb_op = 3'b010; #10; // A AND B
        tb_a = 32'h0000_0101; tb_b = 32'h0000_1010; tb_op = 3'b011; #10; // A OR B
        tb_a = 32'h0000_0011; tb_b = 32'h0000_0101; tb_op = 3'b100; #10; // A XOR B
        tb_op = 3'b101; #10; // XNOR
        tb_a = 32'h0000_0000; tb_b = 32'h0000_0000; tb_op = 3'b110; #10; // ADD
        tb_a = 32'hfffffff; tb_b = 32'hfffffff; #10; // ADD overflow
        tb_a = 32'h0000_000a; tb_b = 32'h0000_0003; #10; // ADD carry
        tb_a = 32'h0000_0001; tb_b = 32'h0000_0080; #10; // ADD
        tb_a = 32'h0000_0007; tb_b = 32'h0000_0007; #10; // ADD
        tb_a = 32'h0000_0003; tb_b = 32'h0000_0003; #10; // ADD
        tb_a = 32'hfffffff; tb_b = 32'h0000_0005; tb_op = 3'b111; #10; // SUBTRACT
        tb_a = 32'h0000_0005; tb_b = 32'h0000_0007; #10; // SUBTRACT borrow
        tb_a = 32'h0000_000a; tb_b = 32'h0000_000a; #10; // SUBTRACT
        tb_a = 32'h0000_0007; tb_b = 32'h0000_0009; #10; // SUBTRACT borrow
        $stop;
    end
endmodule
