`timescale 1ns/100ps

module tb_bus;

  // Inputs
  reg clk, reset_n, m0_req, m0_wr, m1_req, m1_wr;
  reg [7:0] m0_address, m1_address;
  reg [31:0] m0_dout, m1_dout, s0_dout, s1_dout;
  
  // Outputs
  wire m0_grant, m1_grant, s0_sel, s1_sel, s_wr;
  wire [7:0] s_address;
  wire [31:0] m_din, s_din;

  // Instantiate the bus module
  bus U0_bus(
    .clk(clk),
    .reset_n(reset_n),
    .m0_req(m0_req),
    .m0_wr(m0_wr),
    .m0_address(m0_address),
    .m0_dout(m0_dout),
    .m1_req(m1_req),
    .m1_wr(m1_wr),
    .m1_address(m1_address),
    .m1_dout(m1_dout),
    .s0_dout(s0_dout),
    .s1_dout(s1_dout),
    .m0_grant(m0_grant),
    .m1_grant(m1_grant),
    .s0_sel(s0_sel),
    .s1_sel(s1_sel),
    .s_wr(s_wr),
    .s_address(s_address),
    .m_din(m_din),
    .s_din(s_din)
  );

  // Clock generation
  always #5 clk = ~clk; // Assuming a 10ns clock period

  // Test stimuli
  initial begin
    clk = 0;
    reset_n = 0;
    m0_req = 0;
    m0_address = 0;
    m0_wr = 0;
    m0_dout = 0;
    m1_req = 0;
    m1_address = 0;
    m1_wr = 0;
    m1_dout = 0;
    s0_dout = 0;
    s1_dout = 0;
    
    // Provide test stimuli here (change inputs over time for testing)
    // Example:
    #8 reset_n = 1;
    #8 
    m1_req <= 1;
    m0_req <= 1;
    s0_dout = 1;
    s1_dout = 2;
    m0_wr = 1;
    #10

    m0_req = 0;
    m0_address = 8'h01;
    m0_dout = 8'h2;
    #10

    m0_address = 8'h02;
    m0_dout = 8'h4;
    #10

    m1_req = 0;
    m0_address = 8'h03;
    m0_dout = 8'h6;
    #10

    m0_address = 8'h20;
    m0_dout = 8'h20;
    #10

    m1_req <= 1;
    m0_address = 8'h21;
    m0_dout = 8'h22;
    #10

    m0_address = 8'h22;
    m0_dout = 8'h24;
    #10

    m0_req <= 1;
    m0_address = 8'h23;
    m0_dout = 8'h26;
    #10

    m0_address = 8'ha0;
    m0_dout = 8'hff;   
    #10

    m1_req <= 0;
    #20

    reset_n = 0;
    #10 $stop;
  end

  // Add any necessary initial blocks or tasks for initializing inputs
  
  // Add any necessary monitors or checks to validate outputs
  
endmodule
