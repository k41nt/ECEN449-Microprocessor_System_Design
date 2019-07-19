module counter(
input UP, 
input DOWN,
input CLOCK,
input RESET,
output [3:0] LEDS
);
reg [3:0] COUNT; 
reg divided_clk = 1'b0; // divided clock starts at 0
reg [31:0] counter = 1'b0;// use counter to increment the clock
always@(posedge divided_clk) //three buttons to control leds 
	begin
	if(RESET == 1) begin
		COUNT <=1'b0;
		end else if (UP == 1) begin
		COUNT <= COUNT + 1; //count up
		end else if (DOWN == 1) begin
		COUNT <= COUNT - 1; //count down
	end
	end
always@ ( posedge CLOCK ) //divide the clock to 1HZ (1s for one period)
	begin
		counter <= counter + 1'b1;
		if ( counter == 40000000) // overtun the clk1 after 0.5s
								  // clock = 125MHz=0.8E-8 (s)
								  //=>(0.8E-8)*40E6=0.5s
			begin
			divided_clk <= ~divided_clk; //reverse the clock
			counter <= 1'b0; //reset the counter
			end
	end
assign LEDS[3:0] = COUNT[3:0];
endmodule