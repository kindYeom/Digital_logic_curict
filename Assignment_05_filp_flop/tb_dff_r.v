 `timescale 1ns/1ps // Set simulation timescale.

module tb_dff_r();

    // Testbench input signals
    reg clk, reset_n, d;
    // Testbench output signal
    wire q;

    // Instantiate the _dff_r module.
    _dff_r dut(.clk(clk), .reset_n(reset_n), .d(d), .q(q));

    // Clock generation logic
    always begin
        #5 clk = ~clk; // Toggle the clock every 5ns.

    end
	 always begin
    #10 d = ~d; // Toggle the clock every 5ns.

    end

    initial begin
        // Initial values
        clk = 0;
        reset_n = 0;
        d = 0;

        // Display test start message
        $display("Test started");

        // Test case 1: Reset test
        // Apply reset signal (set to active low)
      
        // Wait for 10ns
		  #30;
		  reset_n = 1;

        #30;
		  reset_n = 0;

		  #30;
		  reset_n = 1;

        #30;
		  reset_n = 0;
		  $stop;
        // Expected output: q should become 1 after data input
       
    end

endmodule
