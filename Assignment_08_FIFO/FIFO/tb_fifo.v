   `timescale 1ns/100ps

module tb_fifo;

   reg clk,reset_n,rd_en,wr_en;
   reg [31:0]d_in;
   wire [31:0]d_out;

   wire empty,full,wr_ack,rd_ack,rd_err,wr_err;
   wire [3:0]data_count;

   
   
   parameter INIT = 3'b000;
   parameter WRITE = 3'b001;
   parameter WR_ERROR = 3'b010;
   parameter READ = 3'b011;
   parameter RD_ERROR = 3'b100;
   parameter NO_OP = 3'b101;
   

   fifo U0_fifo(clk,reset_n,rd_en,wr_en,d_in,d_out,full,empty,wr_ack,wr_err,rd_ack,rd_err,data_count);

         
   always begin
      #5 clk = ~clk;
   end
   
  initial begin

  wr_en <= 0;
  rd_en <= 0;
  clk = 0;
  reset_n <= 0;
  d_in <= 0;
  #12 reset_n = 1;
  #10 rd_en = 1;
   #2 d_in = 32'h00000011;
  #10	rd_en = 0;
	wr_en = 1;
   
  #10 d_in = 32'h00000022;
  #10 d_in = 32'h00000033;
  #10 d_in = 32'h00000044;
  #10 d_in = 32'h00000055;
  #10 d_in = 32'h00000066;
  #10 d_in = 32'h00000077;
  #10 d_in = 32'h00000088;
  #10 d_in = 32'h00000099;
	#9 rd_en = 1;
	#13
	wr_en = 0;
	#100
	#10 wr_en = 1;
		 rd_en = 0;
	#10 d_in = 32'h00000066;
	#10 d_in = 32'h00000077;
	#10 d_in = 32'h00000088;
	#10 d_in = 32'h00000099;
	#10 reset_n = 0;	
	
	
	
	
	
	
	
		
		
	
		
  #15 $stop;
   
  end

endmodule