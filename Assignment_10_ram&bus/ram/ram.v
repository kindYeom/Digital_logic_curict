module ram(
    input clk,
    input cen,
    input wen,
    input [4:0] addr,
    input [31:0] din,
    output reg [31:0] dout
);
    reg [31:0] mem [0:31]; // 32 locations of 32-bit memory
    
    integer i; // Loop iterator

    // Initializing memory locations with default values of 0
    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            mem[i] = 32'h0; // Set each memory location to 0; Initial values can be set here
        end
    end

    always @(posedge clk) begin
        if (cen == 0)
            dout = 32'h0; // Output zero if cen is inactive (cen = 0)
        else if (wen == 0)
            dout = mem[addr]; // Read data from memory location indicated by addr when wen is inactive (wen = 0)
        else begin
            mem[addr] = din; // Write data (din) into the memory location indicated by addr when wen is active
            dout = 32'h0; // Output zero after writing
        end
    end
endmodule
