`timescale 1ns/100ps

module tb_fifo_cal_addr;

	reg [2:0] tb_state; // Current state of the FIFO
	reg [2:0] tb_head, tb_tail; // Current head and tail values
	reg [3:0] tb_data_count; // Current data count in the FIFO
	
	wire we, re; // Write enable and read enable signals
	wire [2:0] next_head, next_tail; // Next head and tail values
	wire [3:0] next_data_count; // Next data count in the FIFO

	// Define state parameters for the FIFO module
	parameter INIT = 3'b000;
	parameter WRITE = 3'b001;
	parameter WR_ERROR = 3'b010;
	parameter READ = 3'b011;
	parameter RD_ERROR = 3'b100;
	parameter NO_OP = 3'b101;

	// Instantiate the fifo_cal_addr module
	fifo_cal_addr U0_fifo_cal_addr(tb_state, tb_head, tb_tail, tb_data_count, we, re, next_head, next_tail, next_data_count);

	// Testbench simulation process
	initial begin
		// Initialize state, head, tail, and data count values
		tb_state = INIT;
		tb_head = 0;
		tb_tail = 3;
		tb_data_count = 6;
		#10;

		// Transition to WRITE state
		tb_state = WRITE;
		#10;

		// Transition to READ state
		tb_state = READ;
		#10;

		// Update head and tail values
		tb_tail = 7;
		tb_head = 7;
		tb_state = WRITE;
		#10;

		// Transition to READ state
		tb_state = READ;
		#10;

		// Transition to WRITE state
		tb_state = WRITE;
		#10;

		#10;
		#20 $stop;
	end

endmodule
