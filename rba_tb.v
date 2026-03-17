`include "rba_sub.v"
module rba_tb;

  reg [7:0] A;
  reg [7:0] B_in;
  wire [8:0] Out;

  rba_sub dut (.A(A),.B_in(B_in),.Out(Out));

  initial 
    begin
        $monitor("Time=%0t | A=%d B=%d  -> Out=%d",$time, A, B_in, Out[7:0]);
        
        A = 8'b01110111;  B_in = 8'b01010101;
        #10;

        A = 8'b00010101; B_in = 8'b00001010;
        #10;

        A = 8'b00101010; B_in = 8'b00010101;
        #10;

        A = 8'b01010101; B_in = 8'b00101010;
        #10;

        A = 8'b11110000; B_in = 8'b00001111;
        #10; 

    $finish;
  end

endmodule