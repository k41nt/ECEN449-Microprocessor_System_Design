module hw2_q2_tb();
reg [7:0] In;
wire Out;
hw2_q2 uut(.In(In),
            .Out(Out)
            );
initial 
    begin 
        In = 8'b10101010;//test 1
        #25 In = 8'b11111111;//test 2
        #25 In = 8'b10000010;//test 3
        #25 $stop; // stop after third test
    end
    
initial 
    begin 
        $monitor($time," Input = %b, Parity check = %d", In, Out);
    end
endmodule