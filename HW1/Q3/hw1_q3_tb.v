`timescale 1ns / 1ps
`default_nettype none

module ALU_TEST;
wire [4:0] out;
reg [3:0] a;
reg [3:0] b;
reg [2:0] select;

ALU ALU_test(out,a,b,select);

    initial
        begin
            $monitor($time, " Sel=%b ,A=%d ,B=%d ,Out=%d", select, a, b, out);
            select = 3'b000; a=4'b0000; b=4'b0000;
            #10 select = 3'b001; a=4'b0011; b=4'b0001;
            #10 select = 3'b010; a=4'b0011; b=4'b0001;
            #10 select = 3'b011; a=4'b0011; b=4'b0001;
            #10 select = 3'b100; a=4'b0011; b=4'b0001;
            #10 select = 3'b101; a=4'b0011; b=4'b0001;
            #10 select = 3'b110; a=4'b0011; b=4'b0001;
            #10 select = 3'b111; a=4'b0011; b=4'b0001;
            #10 select = 3'b000; a=4'b0010; b=4'b0010;
            #10 select = 3'b001; a=4'b0010; b=4'b0010;
            #10 select = 3'b010; a=4'b0010; b=4'b0010;
            #10 select = 3'b011; a=4'b0010; b=4'b0010;
            #10 select = 3'b100; a=4'b0010; b=4'b0010;
            #10 select = 3'b101; a=4'b0010; b=4'b0010;
            #10 select = 3'b110; a=4'b0010; b=4'b0010;
            #10 select = 3'b111; a=4'b0010; b=4'b0010;
            #10 select = 3'b000; a=4'b0001; b=4'b0011;
            #10 select = 3'b001; a=4'b0001; b=4'b0011;
            #10 select = 3'b010; a=4'b0001; b=4'b0011;
            #10 select = 3'b011; a=4'b0001; b=4'b0011;
            #10 select = 3'b100; a=4'b0001; b=4'b0011;
            #10 select = 3'b101; a=4'b0001; b=4'b0011;
            #10 select = 3'b110; a=4'b0001; b=4'b0011;
            #10 select = 3'b111; a=4'b0001; b=4'b0011;
        #300 $finish;
        end
        
endmodule