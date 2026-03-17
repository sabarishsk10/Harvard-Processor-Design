`include "register_file.v"
module register_file_tb;

reg clk;
reg rst;
reg wr;
reg [4:0] addr_read;
reg [4:0] addr_write;
reg [7:0] data_input;
wire [7:0] data_output;

register_file dut(.clk(clk), .rst(rst), .wr(wr), .addr_read(addr_read), .addr_write(addr_write), .data_input(data_input), .data_output(data_output));

always #5 clk = ~clk;

initial
    begin
        rst = 1;
        clk = 0;
        wr = 0;
        addr_read = 0;
        addr_write = 0;
        data_input = 0;

        #10;
        rst = 0;
        @(posedge clk); wr = 1; addr_write = 5'd0; data_input = 8'hAA;
        @(posedge clk); wr = 1; addr_write = 5'd1; data_input = 8'hBB;
        @(posedge clk); wr = 1; addr_write = 5'd2; data_input = 8'hCC;
        @(posedge clk); wr = 1; addr_write = 5'd3; data_input = 8'hDD;
        @(posedge clk); wr = 1; addr_write = 5'd4; data_input = 8'hEE;
        @(posedge clk); wr = 1; addr_write = 5'd5; data_input = 8'hFF;
        @(posedge clk); wr = 1; addr_write = 5'd10; data_input = 8'h11;
        @(posedge clk); wr = 1; addr_write = 5'd15; data_input = 8'h22;
        @(posedge clk); wr = 1; addr_write = 5'd20; data_input = 8'h33;
        @(posedge clk); wr = 1; addr_write = 5'd25; data_input = 8'h44;

        #10; wr = 0; addr_read = 5'd0;
        #10; addr_read = 5'd1;
        #10; addr_read = 5'd2;
        #10; addr_read = 5'd3;
        #10; addr_read = 5'd4;
        #10; addr_read = 5'd5;
        #10; addr_read = 5'd10;
        #10; addr_read = 5'd15;
        #10; addr_read = 5'd20;
        #10; addr_read = 5'd25;

        #200;
        $finish;
    end

initial
    begin
        $monitor("Time: %0t | addr_read: %h | data_output: %h", $time, addr_read, data_output);
    end

endmodule