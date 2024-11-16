module BUS(
    input clk, reset_n, m_req, m_wr,               // Input signals
    input [15:0] m_addr,                           // Input address (16-bit)
    input [63:0] m_dout, s0_dout, s1_dout,        // Input data (64-bit)
    
    output reg m_grant,                            // Output grant signal
    output reg s0_sel, s1_sel, s_wr,               // Output selection signals and write signal
    output reg [15:0] s_addr,                      // Output slave address (16-bit)
    output reg [63:0] m_din, s_din                 // Output data to master and slave (64-bit)
);

    // Combinational logic to handle data transfer between master and slaves
    always @(*) begin
        if (reset_n == 1 && m_req == 1) begin  // If reset is not active and a request is made
            s_wr = m_wr;                      // Pass master write signal to slave write signal
            s_din = m_dout;                   // Pass master data out to slave data in
            s_addr = m_addr;                  // Pass master address to slave address
            
            if (s0_sel == 1)                   // If slave 0 is selected
                m_din = s0_dout;              // Pass slave 0 data out to master data in
            else if (s1_sel == 1)              // If slave 1 is selected
                m_din = s1_dout;              // Pass slave 1 data out to master data in
            else
                m_din = 0;                    // If no slave is selected, set master data in to 0
        end else begin                         // If reset is active or no request is made
            s_din = 0;                         // Reset slave data in
            s_wr = 0;                          // Reset slave write signal
            s_addr = 0;                        // Reset slave address
            m_din = 0;                         // Reset master data in
        end
        
        // Slave selection based on address range
        if (m_addr >= 16'h0000 && m_addr <= 16'h07FF) begin  // If address falls within ARM range
            s0_sel <= 1;                                    // Select slave 0
            s1_sel <= 0;                                    // Deselect slave 1
        end else if (m_addr >= 16'h7000 && m_addr <= 16'h71FF) begin  // If address falls within FACTO CORE range
            s0_sel <= 0;                                    // Deselect slave 0
            s1_sel <= 1;                                    // Select slave 1
        end
    end
   
    // Sequential logic triggered by clock edge or negative reset
    always @(posedge clk or negedge reset_n) begin
        if (reset_n == 0)
            m_grant = 0;    // Reset grant signal when reset is active
        else if (m_req == 0)
            m_grant = 0;    // Reset grant signal when no request is made
        else
            m_grant <= 1;   // Set grant signal when a request is made
    end   
endmodule
