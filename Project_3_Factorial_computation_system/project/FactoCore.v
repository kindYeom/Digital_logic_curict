	module FactoCore(clk,reset_n,s_sel,s_wr,s_addr,s_din,s_dout,interrupt);
	

	input clk, reset_n,s_sel,s_wr; // input clk, reset_n, s_sel, s_wr
	input [15:0]s_addr; // address input
	input [63:0]s_din; //data input 
	
	output reg interrupt; // make interrupt
	output reg [63:0]s_dout; // data dout

	wire [63:0]opstart; // op start
	wire [63:0]opclear; // clear 
	wire [63:0]intrEn; // use interrupt
	wire [63:0]operand; // operand 
	
	reg [63:0]opdone;

	reg [63:0]result_h; // data high
	reg [63:0]result_l; // data low
	wire [127:0]result_mul; // data output from booth mul
	
	wire op_done_mul; ///booth mul done 
	
	reg op_clear_mul; // booth mul ceawr
	reg op_clear_mul2; // booth mul clear +d facto mul clear
	reg [63:0]mulr;
	reg [63:0]op_mul;
	
	 always @(*) begin
		interrupt = opdone[0] && intrEn[0]; // interrupt 
		op_clear_mul2  = opclear[0] || op_clear_mul; // op clear 
		if((opclear[0] == 1 || reset_n==0))begin
		result_l <= 1;	// result l
		result_h <=0;
		end
		else begin
		result_h <= result_mul[127:64]; //result h
		result_l <= result_mul[63:0]; 	// result l
		end
 	end
		
	

	 always @(posedge clk or negedge reset_n or posedge opclear[0]) begin // control reg of facto core
			
		if(reset_n ==0)begin 
			opdone <= 0;
			s_dout <= 0; // out result l
		end
		else if(opclear[0] == 1)begin
			opdone = 0;
			s_dout = 0; // out result l
		end
		else begin 

			if(opstart[0]== 1)
				opdone[1] = 1;
				
			if(op_mul == 1)	
				opdone[0] = 1;
			else	
				opdone[0] = 0;
			
		if(s_sel ==1 && s_wr == 0)begin
			case(s_addr[5:3])
				3'b010: 
						s_dout <=opdone; // out done
				3'b101 : 
						s_dout <= result_h; // out result h
				3'b110 :
						s_dout <= result_l; // out result l
				default;
						
			endcase
			end


		end

	end
	

	
//cotrol booth mul
	always@(posedge opstart[0] or posedge op_done_mul or posedge clk or negedge reset_n or posedge opclear[0])begin
		if(reset_n == 0)begin
			mulr = 1; 
			op_mul = operand;
		end
		else if(opclear[0] == 1'b1)begin
			op_clear_mul = 1; // clear mul to0
			mulr <= 1; 
			op_mul = operand;
		end
		else if(op_done_mul == 1)begin
			if(op_mul>2)begin // remain data
				op_clear_mul = 1; // set booth mul
				op_mul = op_mul - 1; // op -- 
				if(result_l == 0)
					mulr<= result_h; // if result_l == 0 mulr = result h
				else	
					mulr <= result_l;  
			end
			else 
				op_mul = 1;	
		end
		else if (opstart[0] == 1)begin
			if(operand!=0 && operand !=1)
				op_clear_mul <= 0;
			else begin
				op_mul = 1;
				op_clear_mul <= 1;
				end
		end
		else begin
				op_mul <= operand; // set operand
				op_clear_mul = 1; // clear mul
		end
	
	end
	FactoCore_reg U0_FactoCore_reg(clk,reset_n,s_sel,s_wr,s_addr,s_din,opstart,opclear,intrEn,operand);
	multiplier U0_multiplier(clk,reset_n,mulr,op_mul,opstart[0],op_clear_mul2,op_done_mul,result_mul); 
endmodule



