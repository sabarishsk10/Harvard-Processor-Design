module data_memory_unit(clk, rst, wr, addr_read, addr_write, data_input, data_output);

input clk;
input rst;
input wr;  // (Write = 1)
input [8:0] addr_read;
input [8:0] addr_write;
input [8:0] data_input;
output reg [8:0] data_output;

reg [7:0] data_mem [255:0];

always @ (posedge clk or posedge rst)
    begin
        if (rst)
            begin
                data_output <= 0;
            end
        else 
            begin
                if (wr)
                    begin
                        data_mem[addr_write] <= data_input;
                    end
                else
                    begin
                        data_output <= data_mem[addr_read];
                    end
            end
    end


endmodule