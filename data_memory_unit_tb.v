`include "data_memory_unit.v"
module data_memory_unit_tb;

reg clk;
reg rst;
reg wr;
reg [8:0] addr_read;
reg [8:0] addr_write;
reg [8:0] data_input;
wire [8:0] data_output;

data_memory_unit uut (.clk(clk), .rst(rst), .wr(wr), .addr_read(addr_read), .addr_write(addr_write), .data_input(data_input), .data_output(data_output));

always #5 clk = ~clk;

initial 
    begin
        clk = 0;
        rst = 1;
        wr = 0;
        addr_read = 0;
        addr_write = 0;
        data_input = 0;
        
        #10 rst = 0; // De-assert reset after 10 time units
        
        // Write operations
        @(posedge clk); wr = 1; addr_write = 9'd10; data_input = 9'd55;
        @(posedge clk); addr_write = 9'd20; data_input = 9'd99;
        @(posedge clk); addr_write = 9'd30; data_input = 9'd120;
        @(posedge clk); addr_write = 9'd40; data_input = 9'd200;
        @(posedge clk); addr_write = 9'd50; data_input = 9'd255;

        // Stop writing
        @(posedge clk); wr = 0;

        // Read operations
        @(posedge clk); addr_read = 9'd10;
        #10 $display("Read Addr = %d  Data = %d", addr_read, data_output);
        @(posedge clk); addr_read = 9'd20;
        #10 $display("Read Addr = %d  Data = %d", addr_read, data_output);
        @(posedge clk); addr_read = 9'd30;
        #10 $display("Read Addr = %d  Data = %d", addr_read, data_output);
        @(posedge clk); addr_read = 9'd40;
        #10 $display("Read Addr = %d  Data = %d", addr_read, data_output);
        @(posedge clk); addr_read = 9'd50;
        #10 $display("Read Addr = %d  Data = %d", addr_read, data_output);
        @(posedge clk); addr_read = 9'd60; // Address that was not written to
        #10 $display("Read Addr = %d  Data = %d", addr_read, data_output);

        #20;
        $finish;
    end

endmodule