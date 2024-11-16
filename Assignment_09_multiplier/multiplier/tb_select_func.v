`timescale 1ns / 1ps

module tb_select_func;

    reg [64:0] mulr;
    reg [63:0] mulc;
    reg op_start;
    reg [127:0] result;
    reg [63:0] count;
    
    wire [64:0] next_mulr;
    wire [127:0] next_result;
    wire [63:0] next_count;

    // Instantiate the select_func module
    select_func UUT (
        .mulr(mulr),
        .mulc(mulc),
        .result(result),
        .count(count),
        .op_start(op_start),
        .next_mulr(next_mulr),
        .next_result(next_result),
        .next_count(next_count)
    );

    // Initial values
    initial begin
        // Initialize inputs
		  op_start = 0;
		  mulr = 3;
		  mulc = 5;
		  result = 16;
		  count = 1;
		  #10
		  op_start = 1;
		  #20
		  count = 2;
		  #10
		  mulr = 0;
		  #10
		  mulr = 1;
		  #10
		   mulr = 2;
		  #10
		  $stop;
    
    end

endmodule
