// case 110001101101
module occur_counter_tb3;
	reg reset, clk;
	reg in;
	wire [2:0]count;
	wire out;

	occur_counter utt3(
		.in(in),
		.reset(reset),
		.clk(clk),
		.out(out),
		.count(count)
		);

	initial begin
		clk=1;
		reset=1;
		in=1;
	end // initial

	always
		#50 clk=~clk;

	initial begin
		#100 reset=1'b0;
		//start the DAT 110001101101
		#100 in=1'b1;
		#100 in=1'b1;
		#100 in=1'b0;
		#100 in=1'b0;
		#100 in=1'b0;
		#100 in=1'b1;
		#100 in=1'b1;
		#100 in=1'b0;
		#100 in=1'b1;
		#100 in=1'b1;
		#100 in=1'b0;
		#100 in=1'b1;
		#100 $finish;
	end // initial

endmodule // occur_counter_tb