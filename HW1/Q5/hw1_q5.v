module ctrl_4bit(a,b,c,d,clk,rst,dir); //define top entity
input clk,rst,dir; //define input signals
output a,b,c,d; //output signals
reg[3:0] ctr; //internal register
reg a,b,c,d;
initial ctr=4'b0000;

always@(posedge clk or posedge rst)
    begin
        if(rst==1'b1)
            ctr<=4'b0000;
        else if (dir==1'b0) // if dir=0, it's increasing
            ctr<=ctr+4'b0001; // increment  
        else if (dir==1'b1)// if dir=1, it's decreasing
            ctr<=ctr-4'b0001; // decrement
            
            
        a <= ctr[3]; //assigning counter output 
        b <= ctr[2];
        c <= ctr[1];
        d <= ctr[0];
    end
endmodule