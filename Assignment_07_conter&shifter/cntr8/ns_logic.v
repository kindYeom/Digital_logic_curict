module ns_logic(load, inc, state, next_state);
  // State Transition Logic for a 3-bit state machine
  // Define state parameters
  parameter IDLE_STATE = 3'b000;
  parameter LOAD_STATE = 3'b001;
  parameter INC_STATE = 3'b010;
  parameter INC2_STATE = 3'b011;
  parameter DEC_STATE = 3'b100;
  parameter DEC2_STATE = 3'b101;
  
  input load, inc;        // Inputs: load and increment signals
  input [2:0] state;      // Current 3-bit state
  output reg[2:0] next_state;  // Output: next state logic
  
  always @(load, inc, state)
  begin
    case(state)
      // Transition conditions for each state
      IDLE_STATE:
        begin
          if(load == 1)
            next_state <= LOAD_STATE;
          else if(inc == 1)
            next_state <= INC_STATE;
          else
            next_state <= DEC_STATE;
        end
      
      LOAD_STATE:
        begin
          if(load == 1)
            next_state <= LOAD_STATE;
          else if(inc == 1)
            next_state <= INC_STATE;
          else
            next_state <= DEC_STATE;
        end
      
      INC_STATE:
        begin
          if(load == 1)
            next_state <= LOAD_STATE;
          else if(inc == 1)
            next_state <= INC2_STATE;
          else
            next_state <= DEC_STATE;
        end
      
      INC2_STATE:
        begin
          if(load == 1)
            next_state <= LOAD_STATE;
          else if(inc == 1)
            next_state <= INC_STATE;
          else
            next_state <= DEC_STATE;
        end
      
      DEC_STATE:
        begin
          if(load == 1)
            next_state <= LOAD_STATE;
          else if(inc == 1)
            next_state <= INC_STATE;
          else
            next_state <= DEC2_STATE;
        end
      
      DEC2_STATE:
        begin
          if(load == 1)
            next_state <= LOAD_STATE;
          else if(inc == 1)
            next_state <= INC_STATE;
          else
            next_state <= DEC_STATE;
        end
      
      default:
        next_state <= 3'bXXX; // Undefined state
      
    endcase
  end
endmodule
