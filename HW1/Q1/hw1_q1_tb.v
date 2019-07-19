`timescale 1ns / 1ps
`default_nettype none
module hw1_q1_tb;
	//Inputs
	reg CLK;
	reg [3:0] IN;
	//Outputs
	wire [3:0] OUT;
	wire CLK_OUT;
	
	//Instantiate the Unit Under Test (UUT)
	hw1_q1 uut(
		.CLK(CLK),
		.IN(IN),
		.CLK_OUT(CLK_OUT),
		.OUT(OUT)
	);

	//generate 20MHz clock signal
	always
		#25 CLK = ~CLK; //since 2MHz is 50ns per cycle
						//=>#25 half cycle
	initial begin
		CLK=0;
		#25 IN=4'b0000; //inputs
		#25 IN=4'b0001;
		#25 IN=4'b0010;
		#25 IN=4'b0011;
		#25 IN=4'b0100;
		#25 IN=4'b0101;
		#25 IN=4'b0110;
		#25 IN=4'b0111;
		#25 IN=4'b1000;
		#25 IN=4'b1001;
		#25 IN=4'b1010;
		#25 IN=4'b1011;
		#25 IN=4'b1100;
		#25 IN=4'b1101;
		#25 IN=4'b1110;
		#25 IN=4'b1111;
	end

	endmodule // hw1_q1_tb


