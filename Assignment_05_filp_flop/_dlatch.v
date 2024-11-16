module _dlatch(clk,d,q,q_bar); // dlatch
	
	input clk; // input clock
	input d;  //input d;
	output q, q_bar; // q, q_bar

	reg q;
	
	always @(clk or d) begin // repeat
		if(clk == 1)begin
		q <= d;// when the clock rise q = d
		end // end 	
	end
	assign q_bar = ~q; // output


endmodule
