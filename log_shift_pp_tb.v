`include "log_left_shift_pp.v"
`include "log_right_shift_pp.v"
module tb_log_shift_pp;

reg  [7:0] In;
reg  [2:0] Sel;
reg  clk, rst;
wire [7:0] Out_L;
wire [7:0] Out_R;

reg [7:0] In_d1, In_d2, In_d3;
reg [2:0] Sel_d1, Sel_d2, Sel_d3;

log_left_shift_pp  ULLS (.In(In),.Out(Out_L),.Sel(Sel),.clk(clk),.rst(rst));

log_right_shift_pp ULRS (.In(In),.Out(Out_R),.Sel(Sel),.clk(clk),.rst(rst));

always #5 clk = ~clk;

always @(posedge clk or posedge rst) 
    begin
        if (rst) 
            begin
                In_d1  <= 8'b0;  In_d2  <= 8'b0;  In_d3  <= 8'b0;
                Sel_d1 <= 3'b0;  Sel_d2 <= 3'b0;  Sel_d3 <= 3'b0;
            end 
        else 
            begin
                In_d1  <= In;
                In_d2  <= In_d1;
                In_d3  <= In_d2;

                Sel_d1 <= Sel;
                Sel_d2 <= Sel_d1;
                Sel_d3 <= Sel_d2;
            end
        end

initial 
    begin
        clk = 0;
        rst = 1;
        In  = 8'b0;
        Sel = 3'b0;

        #12 rst = 0;

        In  = 8'b10110101; 
        Sel = 3'd1; #10;
        Sel = 3'd3; #10;
        Sel = 3'd5; #10;

        In  = 8'b11001110; 
        Sel = 3'd2; #10;
        Sel = 3'd6; #10;
        Sel = 3'd7; #10;

        #40;
        $finish;
    end

always @(posedge clk) 
    begin
        if (!rst) 
            begin
                $display("T=%0t | In=%b | Sel=%0d | Left=%b | Right=%b",$time, In_d3, Sel_d3, Out_L, Out_R);
            end
    end

endmodule