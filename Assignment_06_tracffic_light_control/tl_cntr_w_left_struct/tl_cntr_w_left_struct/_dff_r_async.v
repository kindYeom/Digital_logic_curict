module _dff_r_async (
    input clk,     // Clock input
    input reset_n, // Asynchronous active-low reset input
    input d,       // Data input
    output reg q   // Output signal
);
    
    always @(posedge clk or negedge reset_n) begin
        if (reset_n == 0) 
            q <= 1'b0; // Reset condition: Output q is set to 0
        else 
            q <= d;     // When reset is not active, q follows the input d
    end

endmodule
