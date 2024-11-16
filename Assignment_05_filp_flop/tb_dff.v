	`timescale 1ns/100ps

module tb_dff;

  reg tb_clk;
  reg tb_d;
  wire tb_q;
  wire tb_q_bar;
  

  // Instantiate the D_flip_flop module
  _dff U0_dff(.clk(tb_clk),.d(tb_d),.q(tb_q),.q_bar(tb_q_bar));

  // Generate Clock
  always begin
    #5 tb_clk = ~tb_clk; // Toggle the clock every 5ns.
  end

  // Simulation initialization block
  initial begin
    tb_clk = 1'b0;
    tb_d = 1'b0;
    #7; // Wait for 10ns
    tb_d = 1'b1;
    #7; // Wait for 10ns
    tb_d = 1'b0;
    #7; // Wait for 10ns
	  tb_d = 1'b1;
	 #7;
    $finish; // End the simulation
 
  end

endmodule
