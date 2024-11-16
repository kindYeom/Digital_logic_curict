module FactoCore_reg(
    input clk, reset_n,        // Clock and reset signals
    input s_sel,               // Slave select signal
    input s_wr,                // Slave write signal
    input [15:0] s_addr,       // Slave address (16-bit)
    input [63:0] s_din,        // Slave data input (64-bit)

    output reg [63:0] opstart, // Output registers
    output reg [63:0] opclear,
    output reg [63:0] intrEn,
    output reg [63:0] operand
);

    always @(posedge clk or negedge reset_n) begin
        if (reset_n == 0)
            opstart <= 0;       // Reset opstart on inactive reset signal
        else begin
            if (opclear == 1)
                opstart <= 0;   // Clear opstart if opclear is set

            if (s_sel == 1 && s_wr == 1) begin  // If selected and write enabled
                case (s_addr[5:3])  // Check bits 5 to 3 of the slave address
                    3'b000: opstart <= s_din;  // Store s_din into opstart for address 000
                    3'b001: opclear <= s_din;  // Store s_din into opclear for address 001
                    3'b011: intrEn <= s_din;  // Store s_din into intrEn for address 011
                    3'b100: operand <= s_din; // Store s_din into operand for address 100
                    // Add additional cases for other addresses if needed
                    default: ; // Optional default case if other address ranges are not defined
                endcase
            end
        end
    end

endmodule
