// Testbench module for RAM

`timescale 1ns/100ps

module tb_ram;
    reg tb_clk, tb_cen, tb_wen;
    reg [5:0] tb_addr;
    reg [31:0] tb_din;
    wire [31:0] tb_dout;

    // Instantiate RAM module
    ram U0_ram(
        .clk(tb_clk),
        .cen(tb_cen),
        .wen(tb_wen),
        .addr(tb_addr),
        .din(tb_din),
        .dout(tb_dout)
    );

    // Clock generation
    always begin
        #5 tb_clk = ~tb_clk; // Toggle clock every 5 time units
    end

    // Test scenario
    initial begin
        tb_clk = 0;
        tb_wen = 0;
        tb_cen = 0;
        tb_addr = 1;
        tb_din = 1;

        #10;
        tb_wen = 1;
        tb_cen = 1;
        tb_din = 12515;

        // Sequential memory writes and updates
        // Write data and update address sequentially
        #10;
        repeat (15) begin
            tb_addr = tb_addr + 1;
            tb_din = tb_din - 5;
            #10;
        end

        // Disable write
        tb_wen = 0;

        // Reset address to 1
        #10;
        tb_addr = 1;

        // Sequential address incrementation without write
        // Increment address sequentially without any write operations
        repeat (15) begin
            tb_addr = tb_addr + 1;
            #10;
        end
		  #10
		  tb_wen = 1;
		  #20

        // Stop simulation
        #10;
        $stop;
    end
endmodule
