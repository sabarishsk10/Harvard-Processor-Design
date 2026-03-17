module four_to_one_mux(kgp,sel,op);

input [1:0] kgp;
input [1:0] sel;
output reg [1:0] op;

always @ (*)
begin
        case (sel)
                2'b00:op=2'b00;
                2'b01:op=kgp;
                2'b10:op=kgp;
                2'b11:op=2'b11;
                default:op=2'b00;
        endcase
end

endmodule