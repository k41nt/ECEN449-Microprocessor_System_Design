module Jackpot(
input CLOCK,BUTTON,
input [3:0] SWITCHES,
input RESET,
output [3:0] LEDS
);
reg [3:0] memmory;
reg [3:0] COUNT; 
reg divided_clk = 0; //clock starts at 0
reg [31:0] counter = 1'b0; // use to increment the clock
always@ ( posedge CLOCK ) //divide the clock to 1HZ
	begin
	counter <= counter + 1'b1;
	if ( counter == 40000000) // overtun the clk1 after 0.5s
							  // clock = 125MHz=0.8E-8 (s)
							  //=>(0.8E-8)*40E6=0.5s
		begin
		divided_clk <= ~divided_clk; // reverse the clock
		counter <= 1'b0;// reset clock
		end
	end
always@(posedge divided_clk)
	begin
	if ( RESET ) //reset the LEDS
		begin
		COUNT = 4'b1000;
		end
	else if ( COUNT == 4'b0001 ) //let the LEDS glowing in cycle
		begin
		COUNT = 4'b1000;
		end
	else if (SWITCHES)
	begin
	   #1 memmory<=SWITCHES; // save the position of the switch after 0.5s
	    if ( (COUNT == SWITCHES) && (SWITCHES!=memmory) ) //detect the switch, if memmory== switch it doesnt work
		  begin
		  COUNT = 4'b1111; //win the jackpot
		  end
		else
		  begin
		  COUNT = {COUNT[0], COUNT[3:1]};
		  end
		
	end
	else
		begin
		COUNT = {COUNT[0], COUNT[3:1]}; //move the 1 in cycle,keep the LEDS glowing one by one
		end
	end


/*always@(posedge divided_clk)
    begin
    memmory<=SWITCHES;
    if ((SWITCHES[0]==COUNT[0])&&(SWITCHES[0]&&~memmory))
    begin
    COUNT<=4'b1111;
    end
    
    if ((SWITCHES[1]==COUNT[1])&&(SWITCHES[1]&&~memmory))
    begin
    COUNT<=4'b1111;
    end
    
    if ((SWITCHES[2]==COUNT[2])&&(SWITCHES[2]&&~memmory))
    begin
    COUNT<=4'b1111;
    end
    
    if ((SWITCHES[3]==COUNT[3])&&(SWITCHES[3]&&~memmory))
    begin
    COUNT<=4'b1111;
    end
    
    end*/
assign LEDS[3:0] = COUNT[3:0]; //assign COUNT to LEDS    

endmodule