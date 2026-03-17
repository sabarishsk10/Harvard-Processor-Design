`include "log_left_shift.v"
`include "log_right_shift.v"
module log_shift_tb;

reg  [7:0] In;
reg  [2:0] Sel;
wire [7:0] Out_L;
wire [7:0] Out_R;

log_left_shift LLS (.In(In),.Out(Out_L),.Sel(Sel));

log_right_shift LRS (.In(In),.Out(Out_R),.Sel(Sel));

initial 
    begin
        $monitor("Time=%0t | In=%b | Sel=%d | Left=%b | Right=%b",$time, In, Sel, Out_L, Out_R);

        In = 8'b1011_0101;

        Sel = 3'd0; #10;
        Sel = 3'd1; #10;
        Sel = 3'd2; #10;
        Sel = 3'd3; #10;
        Sel = 3'd4; #10;
        Sel = 3'd5; #10;
        Sel = 3'd6; #10;
        Sel = 3'd7; #10;

        In = 8'b1100_1110;

        Sel = 3'd0; #10;
        Sel = 3'd1; #10;
        Sel = 3'd2; #10;
        Sel = 3'd3; #10;
        Sel = 3'd4; #10;
        Sel = 3'd5; #10;
        Sel = 3'd6; #10;
        Sel = 3'd7; #10;

        $finish;
    end

endmodule