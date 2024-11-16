`timescale 1ns/100ps

module tb_tl_cntr_struct;
    // Input signals
    reg tb_clk, tb_reset_n; // Clock and reset signals
    reg tb_Ta, tb_Tb;       // Inputs Ta and Tb
    
    // Output signals
    wire [1:0] tb_La, tb_Lb; // Outputs La and Lb
    
    // Instance of tl_cntr_struct module
    tl_cntr_struct U0_tl_cntr_struct(.clk(tb_clk), .reset_n(tb_reset_n), .Ta(tb_Ta), .Tb(tb_Tb), .La(tb_La), .Lb(tb_Lb));

    // Clock generation
    always begin
        #5 tb_clk = ~tb_clk; // Toggle clock every 5 time units
    end

    // Testbench stimulus
    initial begin
        tb_clk = 0; tb_reset_n = 0; tb_Ta = 1; tb_Tb = 1; #10 // Initial values
        tb_reset_n = 1; #10 // Release reset

        tb_Ta = 0; tb_Tb = 1; #10 // No action on rising edge of clock

        tb_Ta = 1; tb_Tb = 1; #10 // Current state

        tb_Ta = 1; tb_Tb = 0; #10 // Next state = 01

        tb_Tb = 1; tb_Ta = 1; #10; // Next state = 10
        tb_Ta = 0; #10; // Next state = 00
        tb_reset_n = 0; #100; // Assert reset
        
        $stop; // Stop simulation
    end
endmodule
