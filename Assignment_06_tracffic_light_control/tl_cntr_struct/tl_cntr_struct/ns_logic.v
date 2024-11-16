module ns_logic(TA, TB, state, next_state);
    // Inputs
    input TA, TB;          // Inputs TA and TB
    
    // Inputs and outputs
    input [1:0] state;     // 2-bit state input
    output [1:0] next_state; // 2-bit next state output
    
    // Internal wires
    wire w0, w1;
    
    // XOR gate for computing next_state[1]
    _xor2 U0_xor2(.a(state[1]), .b(state[0]), .y(next_state[1]));
    
    // AND gates for intermediate signals
    _and3 U1_and3(.a(~(state[1])), .b(~(state[0])), .c(~(TA)), .y(w0)); // w0 = ~(state[1]) & ~(state[0]) & ~(TA)
    _and3 U2_and3(.a(state[1]), .b(~(state[0])), .c(~(TB)), .y(w1));  // w1 = state[1] & ~(state[0]) & ~(TB)
    
    // OR gate for computing next_state[0]
    _or2 U3_or2(.a(w0), .b(w1), .y(next_state[0])); // next_state[0] = w0 | w1
endmodule
