module register_file(clk, rst, wr, addr_read, addr_write, data_input, data_output);

input clk;
input rst;
input wr;  // (Write = 1)
input [4:0] addr_read;
input [4:0] addr_write;
input [7:0] data_input;
output reg [7:0] data_output;

reg [7:0] reg_array [31:0];

always @(posedge clk or posedge rst)
    begin
        if(rst)
            begin
                data_output <= 8'b00000000;
            end
        else
            begin
                if(wr)
                    begin
                        reg_array[addr_write] <= data_input;
                    end
                else
                    begin
                        data_output <= reg_array[addr_read];
                    end
            end
    end


endmodule