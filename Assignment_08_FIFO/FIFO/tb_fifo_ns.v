`timescale 1ns/100ps

module tb_fifo_ns;

	reg tb_wr_en, tb_rd_en;
	reg [2:0] tb_state;
	reg [4:0] tb_data_count;
	
	wire [2:0] tb_next_state;

	// Define state parameters for the FIFO module
	parameter INIT = 3'b000;
	parameter WRITE = 3'b001;
	parameter WR_ERROR = 3'b010;
	parameter READ = 3'b011;
	parameter RD_ERROR = 3'b100;
	parameter NO_OP = 3'b101;

	// Instantiate the fifo_ns module
	fifo_ns U0_tb_fifo_ns(tb_wr_en, tb_rd_en, tb_state, tb_data_count, tb_next_state);

	// Testbench simulation process
	initial begin
		// Initialize data count and set the initial state to INIT
		tb_data_count = 0;
		#10;
		tb_state <= INIT;
		tb_wr_en = 1;
		tb_rd_en = 1;
		#10;
		
		// Transition to WRITE state and perform write and read operations
		tb_wr_en = 0;
		tb_rd_en = 1;
		#10;
		tb_wr_en = 1;
		tb_rd_en = 0;
		#10;

		// Set data count to 8 and then back to 0 in WRITE state
		tb_data_count = 8;
		#10;
		tb_data_count = 0;

		// Transition to WR_ERROR state and perform write and read operations
		tb_state <= WR_ERROR;
		tb_wr_en = 0;
		tb_rd_en = 1;
		#10;
		tb_wr_en = 1;
		tb_rd_en = 0;
		#10;

		// Transition to READ state and perform read and write operations
		tb_state <= READ;
		tb_wr_en = 0;
		tb_rd_en = 1;
		#10;
		tb_data_count = 1;
		#10;
		tb_wr_en = 1;
		tb_rd_en = 0;
		#10;

		// Transition to RD_ERROR state and perform read and write operations
		tb_state <= RD_ERROR;
		tb_wr_en = 0;
		tb_rd_en = 1;
		#10;
		tb_wr_en = 1;
		tb_rd_en = 0;
		#10;

		// Transition to NO_OP state and perform read and write operations
		tb_state <= NO_OP;
		tb_wr_en = 0;
		tb_rd_en = 1;
		#10;
		tb_data_count = 0;
		#10;
		tb_wr_en = 1;
		tb_rd_en = 0;
		#10;
		tb_data_count = 8;
		#10;

		// Stop simulation after 20 time units
		#20 $stop;
	end

endmodule
