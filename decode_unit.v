module decode_unit(instr_in, reg_data_A, reg_data_B, operand_out_A, operand_out_B, addr_read_A, addr_read_B);

input [31:0] instr_in;
input [7:0] reg_data_A;
input [7:0] reg_data_B;
output reg [7:0] operand_out_A;
output reg [7:0] operand_out_B;
output reg [4:0] addr_read_A;
output reg [4:0] addr_read_B;

wire [5:0] opcode;
assign opcode = instr_in[31:26];

always @ (instr_in or reg_data_A or reg_data_B)
    begin
        if (opcode == 6'b000100)
            begin
                addr_read_A = instr_in[25:21];
                addr_read_B = instr_in[20:16];
                operand_out_A = reg_data_A;
                operand_out_B = reg_data_B;
            end
        else if (opcode == 6'b000101)
            begin
                addr_read_A = instr_in[25:21];
                addr_read_B = instr_in[20:16];
                operand_out_A = reg_data_A;
                operand_out_B = reg_data_B;
            end
        else if (opcode == 6'b000110)
            begin
                addr_read_A = instr_in[25:21];
                addr_read_B = instr_in[20:16];
                operand_out_A = reg_data_A;
                operand_out_B = reg_data_B;
            end
        else if (opcode == 6'b000111)
            begin    
                addr_read_A = instr_in[25:21];
                addr_read_B = instr_in[20:16];     
                operand_out_A = reg_data_A;
                operand_out_B = reg_data_B;
            end
        else if (opcode == 6'b001000)
            begin
                addr_read_A = instr_in[25:21];
                addr_read_B = instr_in[20:16];
                operand_out_A = reg_data_A;
                operand_out_B = reg_data_B;
            end
        else if (opcode == 6'b001001)
            begin
                addr_read_A = instr_in[25:21];
                addr_read_B = instr_in[20:16];
                operand_out_A = reg_data_A;
                operand_out_B = reg_data_B;
            end
        else if (opcode == 6'b001010)
            begin
                addr_read_A = instr_in[25:21];
                addr_read_B = instr_in[20:16];
                operand_out_A = reg_data_A;
                operand_out_B = reg_data_B;
            end
        else if (opcode == 6'b001011)
            begin
                addr_read_A = instr_in[25:21];
                addr_read_B = instr_in[20:16];
                operand_out_A = reg_data_A;
                operand_out_B = reg_data_B;
            end
        else if (opcode == 6'b001100)
            begin
                addr_read_A = instr_in[25:21];
                addr_read_B = instr_in[20:16];
                operand_out_A = reg_data_A;
                operand_out_B = reg_data_B;
            end
        else if (opcode == 6'b001101)
            begin
                addr_read_A = instr_in[25:21];
                addr_read_B = instr_in[20:16];
                operand_out_A = reg_data_A;
                operand_out_B = reg_data_B;
            end
        else if (opcode == 6'b001110)
            begin
                addr_read_A = instr_in[25:21];
                addr_read_B = instr_in[20:16];
                operand_out_A = reg_data_A;
                operand_out_B = reg_data_B;
            end
        else if (opcode == 6'b001111)
            begin
                addr_read_A = instr_in[25:21];
                addr_read_B = instr_in[20:16];
                operand_out_A = reg_data_A;
                operand_out_B = reg_data_B;
            end
        else if (opcode == 6'b010000)
            begin
                addr_read_A = instr_in[25:21];
                addr_read_B = instr_in[20:16];
                operand_out_A = reg_data_A;
                operand_out_B = reg_data_B;
            end
        else
            begin
                addr_read_A = 5'b00000;
                addr_read_B = 5'b00000;
                operand_out_A = 8'b00000000;
                operand_out_B = 8'b00000000;
            end
    end

endmodule