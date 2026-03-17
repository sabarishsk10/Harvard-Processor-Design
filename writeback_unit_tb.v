`include "writeback_unit.v"
module writeback_unit_tb;

reg [31:0] instr_in;
reg [7:0] alu_result;
reg [7:0] mem_data;
reg [7:0] reg_src_data;
wire [7:0] data_out;
wire [4:0] reg_addr_out;
wire [7:0] mem_addr_out;
wire [4:0] reg_src_addr;
wire [4:0] mem_src_addr;

writeback_unit dut(.instr_in(instr_in), .alu_result(alu_result), .mem_data(mem_data), .reg_src_data(reg_src_data), .data_out(data_out), .reg_addr_out(reg_addr_out), .mem_addr_out(mem_addr_out), .reg_src_addr(reg_src_addr), .mem_src_addr(mem_src_addr));

initial
    begin
        alu_result = 8'h10;
        mem_data = 8'h20;
        reg_src_data = 8'h30;

        #10;

        // MOV immediate
        instr_in = {6'b000000,5'd1,21'd15};
        #10 $display("Opcode: %b   Data: %h   Reg Addr: %d   Mem Addr: %h", instr_in[31:26], data_out, reg_addr_out, mem_addr_out);

        // MOV register
        instr_in = {6'b000001,5'd2,21'd0};
        #10 $display("Opcode: %b   Data: %h   Reg Addr: %d   Mem Addr: %h", instr_in[31:26], data_out, reg_addr_out, mem_addr_out);

        // LOAD
        mem_data = 8'h55;
        instr_in = {6'b000010,5'd3,21'd0};
        #10 $display("Opcode: %b   Data: %h   Reg Addr: %d   Mem Addr: %h", instr_in[31:26], data_out, reg_addr_out, mem_addr_out);

        // STORE
        reg_src_data = 8'hAA;
        instr_in = {6'b000011,5'd4,21'd0};
        #10 $display("Opcode: %b   Data: %h   Reg Addr: %d   Mem Addr: %h", instr_in[31:26], data_out, reg_addr_out, mem_addr_out);

        // ADD
        alu_result = 8'h11;
        instr_in = {6'b000100,26'd0};
        #10 $display("Opcode: %b   Data: %h   Reg Addr: %d   Mem Addr: %h", instr_in[31:26], data_out, reg_addr_out, mem_addr_out);

        // SUB
        alu_result = 8'h22;
        instr_in = {6'b000101,26'd0};
        #10 $display("Opcode: %b   Data: %h   Reg Addr: %d   Mem Addr: %h", instr_in[31:26], data_out, reg_addr_out, mem_addr_out);

        // NEG
        alu_result = 8'h33;
        instr_in = {6'b000110,26'd0};
        #10 $display("Opcode: %b   Data: %h   Reg Addr: %d   Mem Addr: %h", instr_in[31:26], data_out, reg_addr_out, mem_addr_out);

        // MUL
        alu_result = 8'h44;
        instr_in = {6'b000111,26'd0};
        #10 $display("Opcode: %b   Data: %h   Reg Addr: %d   Mem Addr: %h", instr_in[31:26], data_out, reg_addr_out, mem_addr_out);

        // DIV
        alu_result = 8'h55;
        instr_in = {6'b001000,26'd0};
        #10 $display("Opcode: %b   Data: %h   Reg Addr: %d   Mem Addr: %h", instr_in[31:26], data_out, reg_addr_out, mem_addr_out);

        // OR
        alu_result = 8'h66;
        instr_in = {6'b001001,26'd0};
        #10 $display("Opcode: %b   Data: %h   Reg Addr: %d   Mem Addr: %h", instr_in[31:26], data_out, reg_addr_out, mem_addr_out);

        // XOR
        alu_result = 8'h77;
        instr_in = {6'b001010,26'd0};
        #10 $display("Opcode: %b   Data: %h   Reg Addr: %d   Mem Addr: %h", instr_in[31:26], data_out, reg_addr_out, mem_addr_out);

        // NAND
        alu_result = 8'h88;
        instr_in = {6'b001011,26'd0};
        #10 $display("Opcode: %b   Data: %h   Reg Addr: %d   Mem Addr: %h", instr_in[31:26], data_out, reg_addr_out, mem_addr_out);

        // NOR
        alu_result = 8'h99;
        instr_in = {6'b001100,26'd0};
        #10 $display("Opcode: %b   Data: %h   Reg Addr: %d   Mem Addr: %h", instr_in[31:26], data_out, reg_addr_out, mem_addr_out);

        // XNOR
        alu_result = 8'hAA;
        instr_in = {6'b001101,18'd0,8'd10};
        #10 $display("Opcode: %b   Data: %h   Reg Addr: %d   Mem Addr: %h", instr_in[31:26], data_out, reg_addr_out, mem_addr_out);

        // NOT
        alu_result = 8'hBB;
        instr_in = {6'b001110,18'd0,8'd20};
        #10 $display("Opcode: %b   Data: %h   Reg Addr: %d   Mem Addr: %h", instr_in[31:26], data_out, reg_addr_out, mem_addr_out);

        // LLSH
        alu_result = 8'hCC;
        instr_in = {6'b001111,18'd0,8'd30};
        #10 $display("Opcode: %b   Data: %h   Reg Addr: %d   Mem Addr: %h", instr_in[31:26], data_out, reg_addr_out, mem_addr_out);

        // LRSH
        alu_result = 8'hDD;
        instr_in = {6'b010000,18'd0,8'd40};
        #10 $display("Opcode: %b   Data: %h   Reg Addr: %d   Mem Addr: %h", instr_in[31:26], data_out, reg_addr_out, mem_addr_out);

        $display("Simulation Completed");

        $finish;
    end

endmodule