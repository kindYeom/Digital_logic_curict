module ram(
    input clk,
    input cen,
    input wen,
    input [7:0] s_addr,
    input [63:0] s_din,
    output reg [63:0] s_dout
);

    reg [63:0] mem[0:255]; // Declare a memory array with 256 64-bit locations
    
    integer i;

    initial begin
        for (i = 0; i < 256; i = i + 1) begin
            mem[i] = 64'h0; // Set each memory location to 0; Initial values can be set here
        end
    end

    always @(posedge clk) begin
        if (cen == 1 && wen ==1) begin
            mem[s_addr] <= s_din; // Write data to memory at specified address if 'cen' and 'wen' are both high
            s_dout <= 0; // Output is set to 0 during write operation
        end
        else if (cen == 1 && wen == 0) begin
            s_dout <= mem[s_addr]; // Read data from memory at specified address if 'cen' is high and 'wen' is low
        end
        else begin
            s_dout <= 0; // Output is set to 0 if 'cen' is low
        end
    end

endmodule
