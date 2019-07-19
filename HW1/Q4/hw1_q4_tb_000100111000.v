// case 000100111000
module occur_counter_tb1;
	reg reset, clk;
	reg in;
	wire [2:0]count;
	wire out;

	occur_counter utt1(
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
		#50 clk=~clk; //10Mbps=10 Mhz= 1e-7s=> half clock =50e-9s (50 units delay)

	initial begin
		#100 reset=1'b0;
		//start the DAT 000100111000
		in=1'b0;
		#100 in=1'b0;
		#100 in=1'b0;
		#100 in=1'b1;
		#100 in=1'b0;
		#100 in=1'b0;
		#100 in=1'b1;
		#100 in=1'b1;
		#100 in=1'b1;
		#100 in=1'b0;
		#100 in=1'b0;
		#100 in=1'b0;
		#100 $finish;

	end // initial

endmodule // occur_counter_tb