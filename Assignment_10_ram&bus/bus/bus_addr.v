module bus_addr(
    input [7:0] address,
    output reg s0_sel,
    output reg s1_sel
);

    // Input: 8-bit address
    // Outputs: Selection signals s0_sel and s1_sel
    
    // Logic for determining s0_sel and s1_sel based on address ranges
    always @* begin
        if ((address >= 8'h00) && (address < 8'h20)) begin
            s0_sel <= 1; // Set s0_sel to 1 if address is within the range 0x00-0x1F
            s1_sel <= 0; // Set s1_sel to 0
        end
        else if ((address >= 8'h20) && (address < 8'h40)) begin
            s0_sel <= 0; // Set s0_sel to 0
            s1_sel <= 1; // Set s1_sel to 1 if address is within the range 0x20-0x3F
        end
        else begin
            s0_sel <= 0; // Default: Set s0_sel to 0
            s1_sel <= 0; // Default: Set s1_sel to 0
        end
    end
endmodule
