//testbench for the 4-bit synchronous counter
module testbench();
    reg clk,rst,dir;
    wire a,b,c,d;
    
    ctrl_4bit uut(
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .clk(clk),
        .rst(rst),
        .dir(dir)
        );
    
    //initializing inputs
    initial begin
        clk=1'b1;
        rst=1'b0;
        dir=1'b0;
        $monitor("System time(ns):",$time,"      count: %b%b%b%b",a,b,c,d);
        end
    
    //simulating inputs at various time instants
    always
        #10 clk = ~clk;
    
    
    always
        #300 dir=~dir;

endmodule