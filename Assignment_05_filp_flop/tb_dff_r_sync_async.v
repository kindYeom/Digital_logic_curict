 `timescale 1ns/100ps
module tb_dff_r_sync_async;
    reg clk, reset_n, d;
    wire q_sync, q_async;
    
    // Instantiate the _dff_r_sync_async module
    _dff_r_sync_async U0_dff_r_sync_async(.clk(clk), .reset_n(reset_n), .d(d), .q_sync(q_sync), .q_async(q_async));
    
    // Clock generation
    always begin
        #5 clk = ~clk; // clk repeat
    end
	 always begin
        #20 reset_n = ~reset_n; // reset repeat
    end
	 always begin
        #8 d = ~d; // change d
    end
    
// Initial values
    initial begin
        clk = 0;
        reset_n = 0;
        d = 0;
        //set first value
        
        #300 $finish;
    end
endmodule
