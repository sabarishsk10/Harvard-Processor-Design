module fetch_unit(clk, rst, wr,instr_in, addr_in, instr_out);

input clk;
input rst;
input wr;
input [31:0] instr_in;
input [5:0] addr_in;
output reg [31:0] instr_out;

reg [31:0] instr_mem [63:0];
reg [5:0] counter;

always @ (posedge clk or posedge rst)
    begin
        if(rst)
            begin
                instr_out <= 32'b0;
                counter <= 6'b000000;
            end
        else
            begin
                if (wr)
                    begin
                        instr_mem[counter] <= instr_in;
                        counter <= counter + 1;
                    end
                else
                    begin
                        instr_out <= instr_mem[addr_in];
                    end
            end
    end



endmodule