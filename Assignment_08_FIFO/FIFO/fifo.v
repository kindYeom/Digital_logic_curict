module fifo(clk,reset_n,rd_en,wr_en,d_in,d_out,full,empty,wr_ack,wr_err,rd_ack,rd_err,data_count);

		input clk, reset_n,rd_en,wr_en;
		input [31:0]d_in;
	 // Clock input
   // Active-low reset input
  // Read enable input
 // Write enable input
// Data input
		output [31:0]d_out;// Data output
		output full,empty,wr_ack,wr_err,rd_ack,rd_err;
		output [3:0]data_count;
		
      // Full flag output
     // Empty flag output
    // Write acknowledge output
   // Write error output
  // Read acknowledge output
 // Read error output
// Data count output

	// Internal wires for next state, tail, head, data count, write enable, and read enable
		wire [3:0]next_data_count,data_count;
		wire [2:0]next_state,state,tail,head,next_tail,next_head;
		wire we,re;
		  // Register file instantiation
		Register_file U3_Register_file(clk, reset_n, tail, d_in, we, head, d_out,re);

		 // Instantiation of fifo_out module
		fifo_out U2_fifo_out(state,data_count,full,empty,wr_ack,wr_err,rd_ack,rd_err);
		   // Instantiation of fifo_ns module
		fifo_ns U0_fifo_ns(wr_en,rd_en,state,data_count,next_state);

		fifo_cal_addr U1_fifo_cal_addr(next_state,head,tail,data_count,we,re,next_head,next_tail,next_data_count);
		   // Instantiation of fifo_cal_addr module
		register3_r	U4_register3_r(clk, reset_n, next_data_count,next_state,next_tail,next_head, data_count, state,tail,head);
	   // Instantiation of register3_r module
		
endmodule
