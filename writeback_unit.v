module writeback_unit(instr_in, alu_result, mem_data, reg_src_data, reg_src_addr, mem_src_addr, data_out, reg_addr_out, mem_addr_out);

input [31:0] instr_in;
input [7:0] alu_result;
input [7:0] mem_data;
input [7:0] reg_src_data;
output [4:0] reg_src_addr;
output [4:0] mem_src_addr;
output reg [7:0] data_out;
output reg [4:0] reg_addr_out;
output reg [7:0] mem_addr_out;

wire [5:0] opcode;

assign opcode = instr_in[31:26];
assign reg_src_addr = instr_in[4:0];
assign mem_src_data = instr_in[7:0];

always @(instr_in or alu_result or mem_data or reg_src_data)
    begin
        if(opcode == 6'b000000)
            begin
                data_out = instr_in[7:0];
                reg_addr_out = instr_in[25:21];
                mem_addr_out = 8'bxxxxxxxx; 
            end
        else if(opcode == 6'b000001)
            begin
                data_out = reg_src_data;
                reg_addr_out = instr_in[25:21];
                mem_addr_out = 8'bxxxxxxxx;
            end
        else if(opcode == 6'b000010)
            begin
                data_out = mem_data;
                reg_addr_out = instr_in[25:21];
                mem_addr_out = 8'bxxxxxxxx;
            end
        else if(opcode == 6'b000011)
            begin
                data_out = reg_src_data;
                reg_addr_out = 5'bxxxxx;
                mem_addr_out = instr_in[25:18];
            end
        else if(opcode == 6'b000100)
            begin
                data_out = alu_result;
                reg_addr_out = instr_in[20:16];
                mem_addr_out = 8'bxxxxxxxx;
            end
        else if(opcode == 6'b000101)
            begin
                data_out = alu_result;
                reg_addr_out = instr_in[20:15];
                mem_addr_out = 8'bxxxxxxxx;
            end
        else if(opcode == 6'b000110)
            begin
                data_out = alu_result;
                reg_addr_out = instr_in[20:15];
                mem_addr_out = 8'bxxxxxxxx;
            end
        else if(opcode == 6'b000111)
            begin
                data_out = alu_result;
                reg_addr_out = instr_in[20:15];
                mem_addr_out = 8'bxxxxxxxx;
            end
        else if(opcode == 6'b001000)
            begin
                data_out = alu_result;
                reg_addr_out = instr_in[20:15];
                mem_addr_out = 8'bxxxxxxxx;
            end
        else if(opcode == 6'b001001)
            begin
                data_out = alu_result;
                reg_addr_out = instr_in[20:15];
                mem_addr_out = 8'bxxxxxxxx;
            end
        else if(opcode == 6'b001010)
            begin
                data_out = alu_result;
                reg_addr_out = instr_in[20:15];
                mem_addr_out = 8'bxxxxxxxx;
            end
        else if(opcode == 6'b001011)
            begin
                data_out = alu_result;
                reg_addr_out = instr_in[20:15];
                mem_addr_out = 8'bxxxxxxxx;
            end
        else if(opcode == 6'b001100)
            begin
                data_out = alu_result;
                reg_addr_out = instr_in[20:15];
                mem_addr_out = 8'bxxxxxxxx;
            end
        else if(opcode == 6'b001101)
            begin
                data_out = alu_result;
                mem_addr_out = instr_in[7:0];
                reg_addr_out = 5'bxxxxx;
            end
        else if(opcode == 6'b001110)
            begin
                data_out = alu_result;
                mem_addr_out = instr_in[7:0];
                reg_addr_out = 5'bxxxxx;
            end
        else if(opcode == 6'b001111)
            begin
                data_out = alu_result;
                mem_addr_out = instr_in[7:0];
                reg_addr_out = 5'bxxxxx;
            end
        else if(opcode == 6'b010000)
            begin
                data_out = alu_result;
                mem_addr_out = instr_in[7:0];
                reg_addr_out = 5'bxxxxx;
            end
        else
            begin
                data_out = 8'bxxxxxxxx;
                reg_addr_out = 5'bxxxxx;
                mem_addr_out = 8'bxxxxxxxx;
            end
    end

endmodule