`timescale 1ns / 1ps
`default_nettype none

module ALU(OUT, A, B, SEL);
input [3:0] A;
input [3:0] B;
output [4:0] OUT;
input [2:0] SEL; //SELECT signal
reg [4:0] OUT;

// Arithmetic operations based on SELECT signal
always@(A or B or SEL)
    begin
        case(SEL)
            3'b000:
                OUT = A;
            3'b001:
                OUT = A+B;
            3'b010:
                OUT = A-B;
            3'b011:
                OUT = A/B;
            3'b100:
                OUT = A%B;
            3'b101:
                OUT = A<<1;
            3'b110:
                OUT = A>=B;
            3'b111:
                OUT = (A>B);
        default:
            OUT = 5'b11111;
        endcase
    end
endmodule

