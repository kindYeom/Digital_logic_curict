 `timescale 1ns/1ps // Set simulation timescale.

module tb_dff_en;

    // Testbench input signals
    reg clk, en, d;
    // Testbench output signal
    wire q;
    
    // Instantiate the _dff_en module.
    _dff_en dut(.clk(clk), .en(en), .d(d), .q(q));

    // Clock generation logic
    always begin
        #5 clk = ~clk; // Toggle the clock every 5ns.
    end

    // Test case generation
    initial begin
        // Initial values
        clk = 0;
        en = 0;
        d = 0;
        
        // Display test start message
        $display("Test started");
        
        // Run simulation for 20ns.
        #20;
        
        // Activate the Enable signal.
        en = 1;
        // Set input data.
        d = 1;
        // Wait for 20ns
        #20;
        
        // Change input data.
        d = 0;
        // Wait for 20ns
        #20;
        
        // Deactivate the Enable signal.
        en = 0;
        // Wait for 20ns
        #10;
		  d=1;	
		  #10;
        
        // Display test finished message
        $display("Test finished");
        // End the simulation
        $finish;
    end

endmodule