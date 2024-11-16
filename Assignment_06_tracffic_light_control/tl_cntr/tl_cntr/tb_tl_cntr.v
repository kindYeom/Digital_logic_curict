`timescale 1ns/100ps

module tb_tl_cntr;

// Definition of input signals
reg tb_clk, tb_reset_n;
reg tb_Ta, tb_Tb;

// Definition of output signals
wire [1:0] tb_La, tb_Lb;

// Connecting to the Design Under Test (DUT)
tl_cntr U0_tl_cntr(.clk(tb_clk), .reset_n(tb_reset_n), .Ta(tb_Ta), .Tb(tb_Tb), .La(tb_La), .Lb(tb_Lb));

// Generating the clk signal
always begin
    #5 tb_clk = ~tb_clk;
end

// Testbench initialization
initial begin
    tb_clk = 0; tb_reset_n = 1; tb_Ta=1; tb_Tb=1; #10;

    // No action during clock rise
    tb_Ta=1; tb_Tb=1; #10;

    // Current state
    tb_Ta=0; tb_Tb=1; #10;

    // Next state = 01
    tb_Ta=1; tb_Tb=1; #10;

    // Transition to state 00
    tb_Tb = 0; tb_Ta=0; #10; 
    #10;
    #10;

    // Reset the DUT
    tb_reset_n = 0;

    // Wait for a while and stop the simulation
    #100; $stop;
end

endmodule