`timescale 1ns/1ns

module tb_FactoCore;

    reg clk, reset_n, s_sel, s_wr;
    reg [15:0] s_addr;
    reg [63:0] s_din;
	 wire[63:0]s_dout;
    wire interrupt;

	
	
    // Instantiate FactoCore module
    FactoCore UUT(
        .clk(clk),
        .reset_n(reset_n),
        .s_sel(s_sel),
        .s_wr(s_wr),
        .s_addr(s_addr),
        .s_din(s_din),
		  .s_dout(s_dout),
        .interrupt(interrupt)

    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize inputs
			clk = 0;
			reset_n = 0;

			s_wr = 1;
			s_sel = 1;
			#100
			reset_n = 1;	
			#10
			s_addr =16'b0111_0000_0010_0000; // write operand 20
			s_din = 20;
			#10
			s_addr =16'b0111_0000_0001_1000;  //intrEn  = 1
			s_din = 1;
			#10
			s_din = 1;
			s_addr =16'b0111_0000_0000_0000;   // opstart 1	
		  
			#10
			s_wr = 0;
			s_addr =16'b0111_0000_0011_0000;// read result_l
			#14000
			
			s_wr = 1;
			s_addr =16'b0111_0000_0000_1000; // write op_clear 1;
		  	#10
			s_din = 0;
			s_addr =16'b0111_0000_0000_1000; // write op_clear 0;
			#10
			s_addr =16'b0111_0000_0010_0000; // write operand 0
			#10
			s_din = 1;
			s_addr =16'b0111_0000_0000_0000;   // opstart 1			  
			#10
			s_wr = 0;
			s_addr =16'b0111_0000_0011_0000;// read result_l
			#100
			
			s_wr = 1;
			s_addr =16'b0111_0000_0000_1000; // write op_clear 1;
		  	#10
			s_din = 0;
			s_addr =16'b0111_0000_0000_1000; // write op_clear 0;
			#10
			s_din = 1;
			s_addr =16'b0111_0000_0010_0000; // write operand 0
			#10
			s_din = 1;
			s_addr =16'b0111_0000_0000_0000;   // opstart 1			  
			#10
			s_wr = 0;
			s_addr =16'b0111_0000_0011_0000;// read result_l
			#100
			
			
        #30 $stop;
    end



endmodule
