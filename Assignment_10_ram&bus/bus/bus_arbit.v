module bus_arbit(
    input m0_req, m1_req, reset_n, clk,
    output reg m0_grant, m1_grant
);

    // Inputs: m0_req, m1_req, reset_n, clk
    // Outputs: m0_grant, m1_grant

    reg m1_grant_prev; // Register to store the previous m1_grant value

    // Arbitration logic for granting access to modules
    always @(posedge clk or negedge reset_n) begin
        if (reset_n == 0) begin
            m0_grant <= 1; // Grant access to m0 when reset is active
            m1_grant <= 0; // No access to m1 during reset
            m1_grant_prev <= 0; // Initialize m1_grant_prev to 0
        end
        else if ((m0_req == 0 && m1_req == 0) || (m0_req == 1 && m1_req == 0) || (m0_req == 1 && m1_grant_prev == 0)) begin
            m0_grant <= 1; // Grant access to m0 if no request from m1 or if m0 has priority
            m1_grant <= 0; // No access to m1 in this case
            m1_grant_prev <= 0; // Update m1_grant_prev to 0
        end
        else begin
            m0_grant <= 0; // No access to m0
            m1_grant <= 1; // Grant access to m1 if m1 has priority
            m1_grant_prev <= 1; // Update m1_grant_prev to 1
        end
    end
endmodule
