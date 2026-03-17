`include "decode_unit.v"
module decode_unit_tb;

reg [31:0] instr_in;
reg [7:0] reg_data_A;
reg [7:0] reg_data_B;
wire [7:0] operand_out_A;
wire [7:0] operand_out_B;
wire [4:0] addr_read_A;
wire [4:0] addr_read_B;

decode_unit uut (.instr_in(instr_in), .reg_data_A(reg_data_A), .reg_data_B(reg_data_B), .operand_out_A(operand_out_A), .operand_out_B(operand_out_B), .addr_read_A(addr_read_A), .addr_read_B(addr_read_B));

initial 
    begin
        // Opcode: 000100 | RS (AddrA): 00101 (5) | RT (AddrB): 01010 (10) | Padding: 0s
        instr_in = {6'b000100, 5'd5, 5'd10, 16'h0000};
        reg_data_A = 8'hA1;
        reg_data_B = 8'hB2;
        #10;
        $display("Opcode=000100 | AddrA=%d, AddrB=%d | OutA=%h, OutB=%h", addr_read_A, addr_read_B, operand_out_A, operand_out_B);

        // Opcode: 001000 | RS: 00001 (1) | RT: 00010 (2)
        instr_in = {6'b001000, 5'd1, 5'd2, 16'h0000};
        reg_data_A = 8'h11;
        reg_data_B = 8'h22;
        #10;
        $display("Opcode=001000 | AddrA=%d, AddrB=%d | OutA=%h, OutB=%h", addr_read_A, addr_read_B, operand_out_A, operand_out_B);

        // Opcode 010000 (Instruction 13 - Boundary) ---
        instr_in = {6'b010000, 5'd31, 5'd0, 16'h0000};
        reg_data_A = 8'hFF;
        reg_data_B = 8'h00;
        #10;
        $display("Opcode=010000 | AddrA=%d, AddrB=%d | OutA=%h, OutB=%h", addr_read_A, addr_read_B, operand_out_A, operand_out_B);

        //Invalid Opcode ---
        instr_in = {6'b111111, 5'd5, 5'd10, 16'h0000};
        #10;
        $display("Opcode=111111 | AddrA=%d, AddrB=%d | OutA=%h, OutB=%h", addr_read_A, addr_read_B, operand_out_A, operand_out_B);

        $finish;
    end

endmodule