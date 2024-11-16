`timescale 1ns / 1ps // Define timescale

module tb_register_r_op;

    // Declare signals for testbench
    reg clk, reset_n, op_clear;
    reg [64:0] mulr_next;
    reg [127:0] result_next;
    reg [63:0] count_next;
  
    wire [127:0] result;
    wire [64:0] mulr;
    wire [63:0] count;

    // Instantiate the module to be tested
    register_r_op uut(
        .clk(clk),
        .reset_n(reset_n),
        .op_clear(op_clear),
        .result_next(result_next),
        .mulr_next(mulr_next),
        .count_next(count_next),
        .result(result),
        .mulr(mulr),
        .count(count)
    );

    // Clock generation
    always begin
        clk = ~clk; // Toggle clock
        #5; // Adjust delay for desired clock frequency
      
        #5; // Adjust delay for desired clock frequency
    end

    initial begin
        clk = 0; // Initialize clock
        // Initialize inputs
        reset_n = 0;
        op_clear = 0;
        result_next = 128'hABCDE; // Example values for next cycle
        mulr_next = 65'h12345;    // Example values for next cycle
        count_next = 64'h9876;    // Example values for next cycle
        // Provide stimulus

        // Wait for some cycles before applying reset
        #20;

        reset_n = 1; // Apply reset
        #20; // Wait after reset

        // Operation clear scenario
        op_clear = 1;
        #20; // Wait after operation clear

        op_clear = 0; // Clear operation
        #20; // Wait after clearing operation

        #20; // Run for some cycles

        // Add further stimulus, testing, or checks here
        
        // End simulation
        $stop; // Stop simulation
    end

endmodule
