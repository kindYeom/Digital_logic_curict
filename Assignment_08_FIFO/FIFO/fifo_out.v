module fifo_out(state,data_count,full,empty,wr_ack,wr_err,rd_ack,rd_err);
	input			[2:0]state; // Current state input
	input			[3:0]data_count;// Data count input
	
	output reg	empty,full,wr_ack,wr_err,rd_ack,rd_err;
	
// Empty flag output
 // Full flag output
// Write acknowledge output
// Write error output
 // Read acknowledge output
// Read error output

  // Constants defining the states of the finite state machine
	parameter INIT = 3'b000;
	parameter WRITE = 3'b001;
	parameter WR_ERROR = 3'b010;
	parameter READ = 3'b011;
	parameter RD_ERROR = 3'b100;
	parameter NO_OP = 3'b101;
	
	 // Combinational logic for empty and full flags based on data count
always@(*) begin
    case(data_count)
		4'b0000:begin
			empty = 1;
			full = 0;
			end
		4'b1000:begin 
			full = 1;
			empty = 0;
			end
		default:begin
			empty = 0;
			full = 0;
			end
		endcase// end case
  end // always end

   // State machine for handling write and read operations
  always@ (*)begin
    case(state)
		WR_ERROR:begin
			wr_err = 1;
			wr_ack = 0;
			rd_err = 0;
			rd_ack = 0;
			end
		RD_ERROR:begin 
			wr_err = 0;
			wr_ack = 0;
			rd_err = 1;
			rd_ack = 0;
			end
		WRITE:begin 
			wr_err = 0;
			wr_ack = 1;
			rd_err = 0;
			rd_ack = 0;
			end
		READ:begin 
			wr_err = 0;
			wr_ack = 0;
			rd_err = 0;
			rd_ack = 1;
			end	
		
		default:begin
			rd_err = 0;
			rd_ack = 0;
			wr_err = 0;
			wr_ack = 0;
			end
		endcase// end case
  end // always end
	
	
	
	

endmodule
