`timescale 1ns / 1ps
`default_nettype none

module hw2_q3(CLK, IN, CLK_OUT, OUT);
	input wire CLK;
	input wire [3:0] IN;
	output reg [7:0] OUT;
	output reg [3:0] CLK_OUT;

	initial CLK_OUT = 0;
	initial OUT = 8'bXXXXXXX;

	always@(posedge CLK)//CLK_OUT changes at pos edge
	begin
		CLK_OUT <= ~CLK_OUT;
	end

	always@(posedge CLK_OUT)//OUT changes at CLK_OUT
	begin
		#100 OUT<={IN-4'b0010,IN-4'b0001}; //concatenation
	end

endmodule // hw2_q3

