`timescale 1ns / 1ps
`default_nettype none

module hw1_q1(CLK, IN, CLK_OUT, OUT);
	input wire CLK;
	input wire [3:0] IN;
	output reg [3:0] OUT;
	output reg [3:0] CLK_OUT;

	initial CLK_OUT = 0;
	initial OUT = 4'b0000;

	always@(posedge CLK)//CLK_OUT changes at pos edge
	begin
		CLK_OUT = ~CLK_OUT;
	end

	always@(CLK_OUT)//OUT changes at CLK_OUT
	begin
		OUT= IN;
	end

endmodule // hw1_q1

