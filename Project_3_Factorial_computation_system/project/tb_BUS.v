 `timescale 1ns/100ps



module tb_BUS;

    reg clk;
    reg reset_n;
    reg m_req;
    reg m_wr;
    reg [15:0] m_addr;
    reg [63:0] m_dout;
    reg [63:0] s0_dout;
	 reg[63:0] s1_dout;
    
    wire m_grant;
    wire s0_sel;
    wire s1_sel;
    wire s_wr;
    wire [15:0] s_addr;
    wire [63:0] m_din;
    wire [63:0] s_din;

    // Instantiate BUS module
    BUS bus_instance (
        .clk(clk),
        .reset_n(reset_n),
        .m_req(m_req),
        .m_wr(m_wr),
        .m_addr(m_addr),
        .m_dout(m_dout),
        .s0_dout(s0_dout),
        .s1_dout(s1_dout),
        .m_grant(m_grant),
        .s0_sel(s0_sel),
        .s1_sel(s1_sel),
        .s_wr(s_wr),
        .s_addr(s_addr),
        .m_din(m_din),
        .s_din(s_din)
    );

    // Clock generation
    always #5 clk = ~clk; // Assuming a simple clock with a period of 10 time units

    // Testbench stimulus
    initial begin

        // Initialize inputs
        clk = 0;
        reset_n = 0;
        m_req = 0;
        m_wr = 0;
        m_addr = 16'h0000;
        m_dout = 64'h0000000000000000;
			s0_dout = 64'hff;
			s1_dout = 64'hfff;
        // Reset sequence
        reset_n = 0;
        #10;
        reset_n = 1;

        // Test case 1: Simulating a scenario where m_req is asserted
        m_req = 1;
        m_wr = 1;
        m_addr = 16'h0010; // Set desired memory address for testing
        m_dout = 64'hAABBCCDDEEFF0011; // Set desired data for writing
        
        // Add more test cases here as needed...

        #20 
		   m_addr = 16'h7010; 
			m_wr = 0;
			#20 
			m_req = 0;
		  #20
		  $stop; // End simulation
    end

endmodule
