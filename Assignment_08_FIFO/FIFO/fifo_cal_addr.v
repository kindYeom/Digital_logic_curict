module fifo_cal_addr(state,head,tail,data_count,we,re,next_head,next_tail,next_data_count);

	input		[2:0]state,head,tail;
	// Current state input
	// Head pointer input
    // Tail pointer input
	input		[3:0]data_count; // Data count input
	
	output reg 	we,re;
	// Write enable output
	// Read enable output
	output reg	[2:0]next_head,next_tail;
	output reg	[3:0]next_data_count;
	
	// Next head pointer output
   // Next tail pointer output
   // Next data count output
	
	
	// Constants defining the states of the finite state machine
	parameter INIT = 3'b000;
	parameter WRITE = 3'b001;
	parameter WR_ERROR = 3'b010;
	parameter READ = 3'b011;
	parameter RD_ERROR = 3'b100;
	parameter NO_OP = 3'b101;

	// Combinational logic for state transition and next state assignment

	always@(*) begin
		case(state)
			READ:begin
				re =1'b1;
				we = 1'b0;
				next_tail = tail;
				next_head = head+1'b1; 
				
				next_data_count = data_count-1'b1;
			
			end
			
			WRITE:begin
				re =1'b0;
				we = 1'b1;
				next_head = head; 
					next_tail = tail+1'b1;
				
					next_data_count = data_count +1'b1;
					
				end
	
			default:begin
				next_head = head; 
				next_tail = tail;
				next_data_count = data_count;
				we <= 1'b0;
				re <= 1'b0;
		
			end
		endcase
	end
	
	 

endmodule
