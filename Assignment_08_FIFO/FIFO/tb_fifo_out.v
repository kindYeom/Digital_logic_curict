`timescale 1ns/100ps

module tb_fifo_out;

	reg [2:0] tb_state;  // Current state of the FIFO
	reg [4:0] tb_data_count;  // Current data count in the FIFO
	
	wire tb_full, tb_empty, tb_wr_ack, tb_wr_err, tb_rd_ack, tb_rd_err;  // Status and acknowledgment signals

	// Define state parameters for the FIFO module
	parameter INIT = 3'b000;
	parameter WRITE = 3'b001;
	parameter WR_ERROR = 3'b010;
	parameter READ = 3'b011;
	parameter RD_ERROR = 3'b100;
	parameter NO_OP = 3'b101;

	// Instantiate the fifo_out module
	fifo_out U0_fifo_out(tb_state, tb_data_count, tb_full, tb_empty, tb_wr_ack, tb_wr_err, tb_rd_ack, tb_rd_err);

	// Testbench simulation process
	initial begin
		// Initialize data count and set the initial state to INIT
		#10;
		tb_data_count = 0;
		tb_state = INIT;
		#10;

		// Transition to WRITE state
		tb_state = WRITE;
		#10;

		// Transition to WR_ERROR state
		tb_state = WR_ERROR;
		#10;

		// Transition to READ state
		tb_state = READ;
		#10;

		// Transition to RD_ERROR state
		tb_state = RD_ERROR;
		#10;

		// Transition to NO_OP state
		tb_state = NO_OP;
		#10;

		// Set data count to 8
		tb_data_count = 8;
		#20 $stop;
	end

endmodule
