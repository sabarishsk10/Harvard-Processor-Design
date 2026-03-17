`include "wt_mul.v"
module wt_mul_tb();

    reg [7:0] A;
    reg [7:0] B;
    wire [16:0] Out;

    wt_mul dut (.A(A), .B(B), .Out(Out));

    initial
        begin
            $monitor("Time=%0t | A=%d B=%d | Out=%d", $time, A, B, Out);

            A = 8'd5;   B = 8'd4;     
            #20;
            
            A = 8'd12;  B = 8'd10;    
            #20;
            
            A = 8'd10;  B = 8'd20;    
            #20;
            
            A = 8'd5;   B = 8'd10;    
            #20;
            
            A = 8'd170; B = 8'd85;    
            #20;
            
            A = 8'd255; B = 8'd255;   
            #20;
            
            $finish;
        end

endmodule