 `timescale 1ns/100ps

module tb_dlatch; // tb_dlatch
  reg tb_clk; // clock
  reg tb_d; //d
  wire tb_q, tb_q_bar; // output

  // Instantiate the _dlatch module
  _dlatch U0_dlatch (.clk(tb_clk), .d(tb_d), .q(tb_q), .q_bar(tb_q_bar)); //latch module

  // Generate Clock
  always begin
    #5 tb_clk = ~tb_clk; // Toggle the clock every 5ns.
  end

  // Simulation initialization block
  initial begin
    tb_clk = 1'b0; // first clk , d
    tb_d = 1'b0;
    #10; // Wait for 10ns
    tb_d = 1'b1;
    #10; // Wait for 10ns
    tb_d = 1'b0;
    #10; // Wait for 10ns
    $finish; // End the simulation
  end

endmodule
