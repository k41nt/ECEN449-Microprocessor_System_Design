`timescale 1ns / 1ps
`default_nettype none
module hw2_q3_tb;
	//Inputs
	reg CLK;
	reg [3:0] IN;
	//Outputs
	wire [7:0] OUT;
	wire CLK_OUT;
	
	//Instantiate the Unit Under Test (UUT)
	hw2_q3 uut(
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
		#24.999 IN=4'b0000; //first input has to start before #25
		#50 IN=4'b0001;
		#50 IN=4'b0010;
		#50 IN=4'b0011;
		#50 IN=4'b0100;
		#50 IN=4'b0101;
		#50 IN=4'b0110;
		#50 IN=4'b0111;
		#50 IN=4'b1000;
		#50 IN=4'b1001;
		#50 IN=4'b1010;
		#50 IN=4'b1011;
		#50 IN=4'b1100;
		#50 IN=4'b1101;
		#50 IN=4'b1110;
		#50 IN=4'b1111;
		#50 $stop; //stop at 16th input
	end

	endmodule // hw2_q3_tb


