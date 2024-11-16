`timescale 1ns/100ps

module tb_tl_cntr_w_left_struct;
    // Input signals
    reg tb_clk, tb_reset_n; // Clock and reset signals
    reg tb_Ta, tb_Tb, tb_TAL, tb_TBL; // Inputs Ta, Tb, Tal, Tbl
    
    // Output signals
    wire [1:0] tb_La, tb_Lb; // Outputs La, Lb
    
    // Instance of tl_cntr_w_left_struct module
    tl_cntr_w_left_struct U0_tl_cntr_w_left_struct (.clk(tb_clk), .reset_n(tb_reset_n), .Ta(tb_Ta), .Tb(tb_Tb), .La(tb_La), .Lb(tb_Lb), .Tbl(tb_TBL), .Tal(tb_TAL));
    
    // Clock generation
    always begin
        #5 tb_clk = ~tb_clk; // Toggle clock every 5 time units
    end

    // Testbench stimulus
    initial begin
        tb_clk = 0; tb_reset_n = 0; tb_Ta = 1; tb_Tb = 1; tb_TAL = 1; tb_TBL = 1; #10 // Initial values
        tb_reset_n = 1; #10 // Release reset

        tb_Ta = 0; tb_Tb = 0; tb_TAL = 0; tb_TBL = 0; #100 // No action on falling edges of inputs

        tb_reset_n = 0; #10; // Assert reset
        tb_reset_n = 1; #10; // Release reset
        tb_Ta = 0; tb_Tb = 0; tb_TAL = 1; tb_TBL = 1; #50 // Inputs change
        
        $stop; // Stop simulation
    end
endmodule
