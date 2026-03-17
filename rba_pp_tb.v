`include "rba_pp.v"
module rba_pp_tb;

reg [7:0] A, B;
reg clk, rst;
wire [8:0] Out;

rba_pp dut (.A(A), .B(B), .clk(clk), .rst(rst), .Out(Out));

always #10 clk = ~clk;

initial
        begin
        clk = 0;
        rst = 1;
        A  = 0;
        B  = 0;
#5;
    rst = 0;
    A = 8'd170;
    B = 8'd85;

#20;
    
    A = 8'd1;
    B = 8'd127;

#20;
    
    A = 8'd255;
    B = 8'd255;

#20;

    A  = 8'b10101010;
    B  = 8'b01010101;
    
    
#150 $finish;
        
    end

    initial begin
        $monitor("TIME=%0t | Sum => %b", 
                 $time, Out);
    end



endmodule  
