module occur_counter(in, reset,clk, out, count);
	input in;
	input clk;
	input reset;
	output reg out;
	output reg [2:0] count;
	reg [1:0] stt; //state

	always @(posedge clk or negedge reset)
		if (reset==1)
			begin
				stt=2'b00;
				out=0;
				count=0;
			end
		else 
			begin
				case (stt)

					2'b00: //first state
					if (in==0) 
						begin stt=2'b01;//move to next state
							out=0;
						end
					else
						begin stt=2'b00; //otherwise stay
							out=0;
						end

					2'b01: //second state
					if (in==0)
						begin stt=2'b10; //move to next state
							out=0;
						end
					else
						begin stt=2'b00; //otherwise stay
							out=0;
						end
					
					2'b10: // third state
					if (in==0)
						begin stt=2'b10; // third 0 caught, go back to third state and set out=1
							out=1; // out=1, we increment count
						end
					else
						begin stt=2'b00; // go back to first state
							out=0;
						end

					default: stt=2'b00;

				endcase // stt
			end

	always @(posedge out)
		begin
			count=count+1;
		end

endmodule // occur_counter
	




