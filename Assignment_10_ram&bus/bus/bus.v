module bus(
    input clk, reset_n, m0_req, m0_wr, m1_req, m1_wr,
    input [7:0] m0_address, m1_address,
    input [31:0] m0_dout, m1_dout, s0_dout, s1_dout,
    output m0_grant, m1_grant, s_wr,
    output s0_sel, s1_sel,
    output [7:0] s_address,
    output [31:0] m_din, s_din
);

    // Bus module with various components to manage data and control signals

    reg [1:0] y; // Register to combine s0_sel and s1_sel

    // Output signals controlling grants and selections


    // Clock and reset logic to manage y (combination of s0_sel and s1_sel)
    always @(posedge clk, negedge reset_n) begin
        if (reset_n == 0)
            y = 0; // Reset y to 0
        else
            y = {s0_sel, s1_sel}; // Combine s0_sel and s1_sel into y
    end

    // Instantiation of submodules
    bus_arbit U0_bus_arbit(m0_req, m1_req, reset_n, clk, m0_grant, m1_grant);
    mux2 U0_mux2(m0_wr, m1_wr, m1_grant, s_wr);
    mux2_32bit U0_mux2_32bit(m0_dout, m1_dout, m1_grant, s_din);
    mux3_32bit U0_mux3_32bit(reset_n, 32'b0, s0_dout, s1_dout, {s1_sel, s0_sel}, m_din);
    mux2_8bit U0_mux2_8bit(m0_address, m1_address, m1_grant, s_address);
    bus_addr U0_bus_addr(s_address, s0_sel, s1_sel);

endmodule
