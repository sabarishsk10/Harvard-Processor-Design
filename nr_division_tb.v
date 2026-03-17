`include "nr_division.v"
module nr_division_tb;

reg  [7:0] N;
reg  [7:0] D;
wire [7:0] Q;
wire [8:0] R;

nr_division dut (.N(N),.D(D),.Q(Q),.R(R));

initial 
    begin

        N = 8'd100; D = 8'd5;
        #10;

        N = 8'd50; D = 8'd3;
        #10;

        N = 8'd25; D = 8'd4;
        #10;

        N = 8'd200; D = 8'd10;
        #10;

        N = 8'd15; D = 8'd2;
        #10;

        N = 8'd128; D = 8'd7;
        #10;

        N = 8'd99; D = 8'd9;
        #10;

        N = 8'd64; D = 8'd8;
        #10;

        N = 8'd37; D = 8'd6;
        #10;

        $finish;
    end

initial
    begin
        $monitor("Time=%0t | N=%d D=%d | Q=%d R=%d", $time, N, D, Q, R);
    end

endmodule