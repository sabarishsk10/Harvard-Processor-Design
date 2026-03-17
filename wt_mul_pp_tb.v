`include "wt_mul_pp.v"
module wt_mul_pp_tb;

reg [7:0] A, B;
reg clk, rst;
wire [16:0] Out;

reg [7:0] A1, A2, A3;
reg [7:0] B1, B2, B3;

wt_mul_pp dut (.A(A), .B(B), .clk(clk), .rst(rst), .Out(Out));

always #10 clk = ~clk;

always @(posedge clk) 
    begin
        if (rst)
            begin
                A1 <= 0;  
                A2 <= 0;  
                A3 <= 0;
                B1 <= 0;  
                B2 <= 0;  
                B3 <= 0;
            end
    else 
        begin
            A1 <= A;   
            A2 <= A1;   
            A3 <= A2;
            B1 <= B;   
            B2 <= B1;   
            B3 <= B2;
        end
end

initial 
    begin
        clk = 0;
        rst = 1;
        A = 0;
        B = 0;
        #15 
        
        rst = 0;
        #20 

        A = 8'd5;    B = 8'd4;
        #20 

        A = 8'd12;   B = 8'd10;
        #20 
        
        A = 8'd10;   B = 8'd20;
        #20 
        
        A = 8'd255;  B = 8'd2;
        #20 
        
        A = 8'd255;  B = 8'd255;
        
        #200$finish;
    end

initial 
    begin
        $monitor("TIME=%0t | %d × %d = %d", $time, A3, B3, Out);
    end

endmodule