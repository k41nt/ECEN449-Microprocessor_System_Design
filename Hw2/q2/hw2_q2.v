module hw2_q2(Out, In);
input [7:0] In;
output reg Out;
integer i = 0;
integer cnt = 0;

always@(In)
begin
for(i = 0; i < 8; i =i+1)
    begin
        if(In[i] == 1)//count the number of 1
            cnt = cnt + 1;
    end
    if((cnt % 2) == 1) //If the number of 1s is odd, parity is 1
        Out = 1;
    else
        Out = 0;//parity is 0 if the 1's are even
    end
endmodule 