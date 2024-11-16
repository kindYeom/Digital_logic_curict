module o_logic(state, LA, LB);
    // Inputs
    input [2:0] state;   // 3-bit input state
    
    // Outputs
    output [1:0] LA, LB; // 2-bit outputs LA, LB
    
    // Internal wire
    wire w0;
    
    // AND gate U0_and2 for w0
    _and2 U0_and2(state[1], ~state[0], w0); // w0 = state[1] & ~state[0]
    
    // OR gates for LA and LB outputs
    _or2 U0_or2(w0, state[2], LA[1]); // LA[1] = w0 | state[2]
    _or2 U1_or2(state[0], state[2], LA[0]); // LA[0] = state[0] | state[2]
    _or2 U2_or2(w0, ~state[2], LB[1]); // LB[1] = w0 | ~state[2]
    _or2 U3_or2(~state[2], state[0], LB[0]); // LB[0] = ~state[2] | state[0]
endmodule
