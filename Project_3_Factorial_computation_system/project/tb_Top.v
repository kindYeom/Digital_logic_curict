`timescale 1ns/100ps
	


module tb_Top;
	reg clk,reset_n,m_req,m_wr;
	reg [15:0]m_addr;
	reg [63:0]m_dout;
	
	wire m_grant;
	wire [63:0]m_din;
	wire interrupt;


	
	Top U0_Top(clk,reset_n,m_req,m_wr,m_addr,m_dout,m_grant,m_din,interrupt);
	
	
	always begin
		#5 clk = ~clk;
	end
	
	
	initial
	begin

	clk =0;
	reset_n = 0;
	m_req = 0;
	m_wr = 0;
	m_addr = 0;
	m_dout = 0;
	#10
	reset_n  = 1;
	#10
	m_wr = 1;	
	m_req = 1;
	m_addr =16'b000_0000_0010_0000; // write operand 0
	m_dout = 0;
	#10
	m_addr =m_addr  + 8;
	m_dout = m_dout  + 5;
	#10
	m_addr = m_addr  + 8;
		m_dout = m_dout  + 5;
	#10
	m_addr = m_addr  + 8;
		m_dout = m_dout  + 5;
	#10
	m_addr = m_addr  + 8;
		m_dout = m_dout  + 5;
	#10
	m_addr = m_addr  + 8;
		m_dout = m_dout  + 5;
	#10	
		m_wr = 0;	
	#10
	m_addr = m_addr  - 8;
	#10
	m_addr = m_addr  - 8;
	#10
	m_addr = m_addr  - 8;
	#10
	m_addr = m_addr  - 8;
		
		
	#400$stop;
	
	
	end
	endmodule
	