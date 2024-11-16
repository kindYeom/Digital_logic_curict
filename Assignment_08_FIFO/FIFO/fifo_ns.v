module fifo_ns(wr_en,rd_en,state,data_count,next_state);
	input		wr_en,rd_en; // write, read enable
	input		[2:0]state; // // Current state input
	input		[3:0]data_count;// Data count input

	output reg	[2:0]next_state;// Next state output
	
	
	parameter INIT = 3'b000;
	parameter WRITE = 3'b001;
	parameter WR_ERROR = 3'b010;
	parameter READ = 3'b011;
	parameter RD_ERROR = 3'b100;

	parameter NO_OP = 3'b101;
	// State transition logic based on current state and control signals
	always@ (*)begin
    case(state)
      INIT: begin
		// Transition to NO_OP state if both write and read are enabled,
                // otherwise, move to WRITE or READ state based on control signals
		if(wr_en == 1&&rd_en ==1)
			next_state = NO_OP;
		else if(wr_en == 1)
			next_state = WRITE;
		else if(rd_en == 1)
			next_state = READ;
		else
		next_state = NO_OP;
		
		end
		
      WRITE: begin
		 // Transition to NO_OP state if both write and read are enabled,
                // else, move to WRITE, READ, or WR_ERROR based on control signals
		if(wr_en == 1 && rd_en == 1)
				next_state = NO_OP;
		else if(wr_en ==1)
			if(data_count ==8)
			 // Check if data count limit (8) is reached, move to WR_ERROR
				next_state =WR_ERROR;
			else
				next_state = WRITE;
		else if(rd_en == 1)
			next_state = READ;
		else
			next_state = NO_OP;
		end	
		
		WR_ERROR:begin
		// Transition to NO_OP state if both write and read are enabled,
                // else, move to READ or stay in WR_ERROR state based on control signals
                if(wr_en && rd_en)
		if(wr_en == 1 && rd_en == 1)
				next_state = NO_OP;
		else if(wr_en ==1)
				next_state <=WR_ERROR;
		else if(rd_en == 1)
			next_state = READ;
		else
			next_state = NO_OP;	
		end
		
		READ: begin
		// Transition to NO_OP state if both write and read are enabled,
                // else, move to WRITE, READ, or RD_ERROR based on control signals
		if(wr_en == 1 && rd_en == 1)
				next_state = NO_OP;
		else if(wr_en ==1)
				next_state <= WRITE;
		else if(rd_en == 1)
			if(data_count == 0)
			 // Check if data count is 0, move to RD_ERROR, otherwise, stay in READ state
				next_state = RD_ERROR;
			else
				next_state = READ;
		else
			next_state = NO_OP;
		end
		
		RD_ERROR: begin
	 // Transition to NO_OP state if both write and read are enabled,
                // else, move to WRITE or stay in RD_ERROR state based on control signals	
		if(wr_en == 1 && rd_en == 1)
				next_state = NO_OP;
		else if(wr_en ==1)
				next_state = WRITE;
		else if(rd_en == 1)
				next_state = RD_ERROR;
		else
			next_state <= NO_OP;
		end
		
		NO_OP: begin
		if(wr_en == 1 && rd_en == 1)
				next_state = NO_OP;
		else if(wr_en ==1)
				if(data_count ==8)
				next_state =WR_ERROR;
			else
				next_state = WRITE;
		else if(rd_en == 1)
			if(data_count == 0)
				next_state = RD_ERROR;
			else
				next_state = READ;
		else
			next_state = NO_OP;
		end
		 default: next_state = NO_OP;
		
		endcase// end case
  end // always end


endmodule
