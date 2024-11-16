module o_logic(state, LA, LB);
    // Inputs
    input [1:0] state; // 2-bit state input
    
    // Outputs
    output [1:0] LA, LB; // 2-bit outputs LA and LB
    
    // Assign LA[1] to state[1]
    assign LA[1] = state[1];
    
    // AND gate U0_and2 for LA[0]
    _and2 U0_and2(.a(~state[1]), .b(state[0]), .y(LA[0])); // LA[0] = ~state[1] & state[0]
    
    // Assign LB[1] to ~state[1]
    assign LB[1] = ~state[1];
    
    // AND gate U1_and2 for LB[0]
    _and2 U1_and2(.a(state[1]), .b(state[0]), .y(LB[0])); // LB[0] = state[1] & state[0]
endmodule
