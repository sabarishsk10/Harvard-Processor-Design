`include "fetch_unit.v"
module fetch_unit_tb;

reg clk;
reg rst;
reg wr;
reg [31:0] instr_in;
reg [5:0] addr_in;
wire [31:0] instr_out;

fetch_unit dut(.clk(clk), .rst(rst), .wr(wr), .instr_in(instr_in), .addr_in(addr_in), .instr_out(instr_out));

always #5 clk = ~clk;

initial
    begin
        rst = 1;
        clk = 0;
        wr = 0;
        instr_in = 32'h00000000;
        addr_in = 6'b000000;
        #10;

        rst = 0;
        @(posedge clk); wr = 1;
        @(posedge clk); instr_in = 32'h12345678;
        @(posedge clk); instr_in = 32'h9abcdef0;
        @(posedge clk); instr_in = 32'hdeadbeef;
        @(posedge clk); instr_in = 32'hfeedface;
        @(posedge clk); instr_in = 32'hcafebabe;
        @(posedge clk); instr_in = 32'h0badcafe;
        @(posedge clk); instr_in = 32'hfaceb00c;
        @(posedge clk); instr_in = 32'hbeefcafe;
        @(posedge clk); instr_in = 32'hc0ffee00;
        @(posedge clk); instr_in = 32'hdeadbead;
        @(posedge clk); wr = 0;
        
        #10; addr_in = 6'd0;
        #10; addr_in = 6'd1;
        #10; addr_in = 6'd5;
        #10; addr_in = 6'd7;
        #10; addr_in = 6'd9;

        #200;
        $finish;
    end

initial 
    begin
        $monitor("Time: %0t | addr_in: %h | instr_out: %h", $time, addr_in, instr_out);
    end

endmodule