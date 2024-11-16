module tb_multiplier;

    reg clk, reset_n, op_clear, op_start;
    reg [63:0] multiplier, multiplicand;
    

    wire op_done;

    wire [127:0] result;
    
    multiplier UUT (
        .clk(clk),
        .reset_n(reset_n),
        .op_clear(op_clear),
        .op_start(op_start),
        .multiplier(multiplier),
        .multiplicand(multiplicand),
        .op_done(op_done),
        .result(result)

    );
	 
	 
	 always begin
	 
	 #5 clk = ~clk;
	 end

    initial begin
        // Clock Generation
      
		clk = 0;
		
		reset_n = 0;
		op_clear = 1;
		op_start = 0;
		multiplier = -32;
		multiplicand = 1241;
		#10
		reset_n  = 1;
		op_clear = 0;
	
		#100
		op_start = 1;

		#100 
		op_start = 0;
		#50
		op_start = 1;
       
    #1000 
	 op_clear = 1;
	 #10 
	 op_clear = 0;
	  #1000  $stop;
    end

    // Display or check results here to verify the module's operation as expected.
    // This allows verification that the module is behaving as intended.

endmodule
