module nr_division_pp(N, D, Q, R, clk, rst);

input [7:0] N; 
input [7:0] D;  
output reg [7:0] Q; 
output reg [8:0] R;
input clk, rst;

//Stage 1:
reg [7:0] N1;
reg [7:0] D1;
reg [7:0] Q1;
reg [8:0] R1;
wire [8:0] R11;
wire [8:0] R12;
assign R11 = {8'b0, N[7]};
assign R12 = R11 - {1'b0, D};

always @(posedge clk or posedge rst)
    begin
        if (rst)
            begin
                Q1 <= 8'b0;
                R1 <= 9'b0;
                N1 <= 8'b0;
                D1 <= 8'b0;
            end
        else
            begin
                Q1 <= {N[6:0], !R12[8]};
                R1 <= R12;
                N1 <= N;
                D1 <= D;
            end
    end

//Stage 2;
reg [7:0] N2;
reg [7:0] D2;
reg [7:0] Q2;
reg [8:0] R2;
wire [8:0] R21;
wire [8:0] R22;
assign R21 = {R1[7:0], Q1[7]};
assign R22 = R1[8] ? (R21 + {1'b0, D1}) : (R21 - {1'b0, D1});

always @(posedge clk or posedge rst)
    begin
        if (rst)
            begin
                Q2 <= 8'b0;
                R2 <= 9'b0;
                N2 <= 8'b0;
                D2 <= 8'b0;
            end
        else
            begin
                Q2 <= {Q1[6:0], !R22[8]};
                R2 <= R22;
                N2 <= N1;
                D2 <= D1;
            end
    end

//Stage 3;
reg [7:0] N3;
reg [7:0] D3;
reg [7:0] Q3;
reg [8:0] R3;
wire [8:0] R31;
wire [8:0] R32;
assign R31 = {R2[7:0], Q2[7]};
assign R32 = R2[8] ? (R31 + {1'b0, D2}) : (R31 - {1'b0, D2});

always @(posedge clk or posedge rst)
    begin
        if (rst)
            begin
                Q3 <= 8'b0;
                R3 <= 9'b0;
                N3 <= 8'b0;
                D3 <= 8'b0;
            end
        else
            begin
                Q3 <= {Q2[6:0], !R32[8]};
                R3 <= R32;
                N3 <= N2;
                D3 <= D2;
            end
    end

//Stage 4;
reg [7:0] N4;
reg [7:0] D4;
reg [7:0] Q4;
reg [8:0] R4;
wire [8:0] R41;
wire [8:0] R42;
assign R41 = {R3[7:0], Q3[7]};
assign R42 = R3[8] ? (R41 + {1'b0, D3}) : (R41 - {1'b0, D3});

always @(posedge clk or posedge rst)
    begin
        if (rst)
            begin
                Q4 <= 8'b0;
                R4 <= 9'b0;
                N4 <= 8'b0;
                D4 <= 8'b0;
            end
        else
            begin
                Q4 <= {Q3[6:0], !R42[8]};
                R4 <= R42;
                N4 <= N3;
                D4 <= D3;
            end
    end

//Stage 5;
reg [7:0] N5;
reg [7:0] D5;
reg [7:0] Q5;
reg [8:0] R5;
wire [8:0] R51;
wire [8:0] R52;
assign R51 = {R4[7:0], Q4[7]};
assign R52 = R4[8] ? (R51 + {1'b0, D4}) : (R51 - {1'b0, D4});

always @(posedge clk or posedge rst)
    begin
        if (rst)
            begin
                Q5 <= 8'b0;
                R5 <= 9'b0;
                N5 <= 8'b0;
                D5 <= 8'b0;
            end
        else
            begin
                Q5 <= {Q4[6:0], !R52[8]};
                R5 <= R52;
                N5 <= N4;
                D5 <= D4;
            end
    end

//Stage 6;
reg [7:0] N6;
reg [7:0] D6;
reg [7:0] Q6;
reg [8:0] R6;
wire [8:0] R61;
wire [8:0] R62;
assign R61 = {R5[7:0], Q5[7]};
assign R62 = R5[8] ? (R61 + {1'b0, D5}) : (R61 - {1'b0, D5});

always @(posedge clk or posedge rst)
    begin
        if (rst)
            begin
                Q6 <= 8'b0;
                R6 <= 9'b0;
                N6 <= 8'b0;
                D6 <= 8'b0;
            end
        else
            begin
                Q6 <= {Q5[6:0], !R62[8]};
                R6 <= R62;
                N6 <= N5;
                D6 <= D5;
            end
    end

//Stage 7;
reg [7:0] N7;
reg [7:0] D7;
reg [7:0] Q7;
reg [8:0] R7;
wire [8:0] R71;
wire [8:0] R72;
assign R71 = {R6[7:0], Q6[7]};
assign R72 = R6[8] ? (R71 + {1'b0, D6}) : (R71 - {1'b0, D6});

always @(posedge clk or posedge rst)
    begin
        if (rst)
            begin
                Q7 <= 8'b0;
                R7 <= 9'b0;
                N7 <= 8'b0;
                D7 <= 8'b0;
            end
        else
            begin
                Q7 <= {Q6[6:0], !R72[8]};
                R7 <= R72;
                N7 <= N6;
                D7 <= D6;
            end
    end

//Stage 8:
reg [7:0] N8;
reg [7:0] D8;
reg [7:0] Q8;
reg [8:0] R8;
wire [8:0] R81;
wire [8:0] R82;
assign R81 = {R7[7:0], Q7[7]};
assign R82 = R7[8] ? (R81 + {1'b0, D7}) : (R81 - {1'b0, D7});

always @(posedge clk or posedge rst)
    begin
        if (rst)
            begin
                Q8 <= 8'b0;
                R8 <= 9'b0;
                N8 <= 8'b0;
                D8 <= 8'b0;
            end
        else
            begin
                Q8 <= {Q7[6:0], !R82[8]};
                R8 <= R82;
                N8 <= N7;
                D8 <= D7;
            end
    end

// Final Output:
wire [8:0] R_f1;
wire [8:0] R_f;
assign R_f1 = R8 + {1'b0, D8};
assign R_f = R8[8] ? R_f1 : R8;

always @(posedge clk or posedge rst)
    begin
        if (rst) 
            begin
                Q <= 8'b0;
                R <= 9'b0;
            end
        else 
            begin
                Q <= Q8;
                R <= R_f;
            end
    end

endmodule