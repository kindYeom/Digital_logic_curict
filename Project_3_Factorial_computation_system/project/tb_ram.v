`timescale 1ns/1ns

module tb_ram;

    reg clk;
    reg cen;
    reg wen;
    reg [7:0] s_addr;
    reg [63:0] s_din;
    wire [63:0] s_dout;

    // Instantiate the RAM module
    ram ram_instance (
        .clk(clk),
        .cen(cen),
        .wen(wen),
        .s_addr(s_addr),
        .s_din(s_din),
        .s_dout(s_dout)
    );

    // Clock generation
    always #5 clk = ~clk; // Creating a simple clock with period 10 time units

    // Testbench stimulus
    initial begin


        // Initialize inputs
        clk = 0;
        cen = 0;
        wen = 0;
        s_addr = 8'b0;
        s_din = 64'b10101010;
		

        // Writing to memory
        cen = 0;
        wen = 1;
        s_addr = 8'b0010; // Writing to address 2
        #20; // Wait for 20 time units

		  #10 
        s_din = s_din +1;		  
		  s_addr = s_addr + 1;	
	  cen = 1;	  
		  #10 
        s_din = s_din +1;		  
		  s_addr = s_addr + 1;
		  #10
		  
        // Reading from memory
        wen = 0;
     
        #20 // Wait for 20 time units
			s_addr = s_addr - 1;
			#10
			s_addr = s_addr - 1;
			#10
			s_addr = s_addr - 1;			
			#10
			s_addr = s_addr - 1;	

        $finish; // End simulation
    end

endmodule

