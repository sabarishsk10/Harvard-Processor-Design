`include "nr_division_pp.v"
module nr_division_pp_tb;

reg clk, rst;
reg [7:0] N, D;
wire [7:0] Q;
wire [8:0] R;

nr_division_pp dut (.clk(clk), .rst(rst), .N(N), .D(D), .Q(Q), .R(R));

initial clk = 0;
always #10 clk = ~clk;

task do_divide(input [7:0] a, input [7:0] b);
    begin   
        @(negedge clk);
        N = a;
        D = b;

        repeat(9) @(posedge clk);
        #2; 
        $display("TIME=%4t | %3d / %3d => Q=%3d R=%3d", $time, a, b, Q, R[7:0]);
    end
endtask

initial begin
    rst = 1; N = 0; D = 0;
    repeat(2) @(posedge clk);
    rst = 0;

    do_divide(8'd100, 8'd10);
    do_divide(8'd255, 8'd15);
    do_divide(8'd200, 8'd7);
    do_divide(8'd50,  8'd3);
    do_divide(8'd254, 8'd100);
    do_divide(8'd222, 8'd19);
    do_divide(8'd99,  8'd20);
    do_divide(8'd101, 8'd10);
    do_divide(8'd160, 8'd160);

    $finish;
end

endmodule