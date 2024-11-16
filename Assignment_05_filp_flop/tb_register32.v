`timescale 1ns / 1ps  // Define timescale for simulation accuracy

module tb_register32();  // Testbench module definition
    reg clk;  // Declare clock signal
    reg [31:0] d;  // Declare input data bus
    wire [31:0] q;  // Declare output data bus

    // Instantiate the _register32 module
    _register32 UUT (
        .clk(clk),  // Connect clock signal
        .d(d),      // Connect input data bus
        .q(q)       // Connect output data bus
    );

    // Clock generation
    always begin
        #5 clk = ~clk;  // Toggle the clock every 5 time units
    end

    // Stimulus generation
    initial begin
        clk = 0;  // Initialize clock to 0
        d = 32'hA5A5A5A5;  // Assign a sample input data
        
        // Wait for 10 time units before applying another input
        #7 d = 32'h12345678;  // Assign another sample input data
        
        // Add more test cases as needed
		  #7 d = 32'h12345545;
        
        #10 $stop;  // Stop simulation after 10 time units
    end

    // Monitor the output q
    always @(posedge clk) begin
        $display("q = %h", q);  // Display the output q in hexadecimal format on every positive clock edge
    end

endmodule