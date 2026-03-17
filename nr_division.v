module nr_division(N, D, Q, R);

    input [7:0] N;     // Dividend
    input [7:0] D;    // Divisor
    output [7:0] Q;  // Quotient
    output [8:0] R; // Remainder

    wire [8:0] D_extended = {1'b0, D};
    wire [8:0] D_comp = (~D_extended) + 9'b1;

    // Stage 1:
    wire [7:0] Q1;
    wire [8:0] R11, R12;
    assign R11 = {8'b0, N[7]};
    assign R12 = R11[8] ? (R11 + D_extended) : (R11 + D_comp);
    assign Q1  = {N[6:0], !R12[8]};

    // Stage 2:
    wire [7:0] Q2;
    wire [8:0] R21, R22;
    assign R21 = {R12[7:0], Q1[7]};
    assign R22 = R21[8] ? (R21 + D_extended) : (R21 + D_comp);
    assign Q2  = {Q1[6:0], !R22[8]};

    // Stage 3:
    wire [7:0] Q3;
    wire [8:0] R31, R32;
    assign R31 = {R22[7:0], Q2[7]};
    assign R32 = R31[8] ? (R31 + D_extended) : (R31 + D_comp);
    assign Q3  = {Q2[6:0], !R32[8]};

    // Stage 4:
    wire [7:0] Q4;
    wire [8:0] R41, R42;
    assign R41 = {R32[7:0], Q3[7]};
    assign R42 = R41[8] ? (R41 + D_extended) : (R41 + D_comp);
    assign Q4  = {Q3[6:0], !R42[8]};

    // Stage 5:
    wire [7:0] Q5;
    wire [8:0] R51, R52;
    assign R51 = {R42[7:0], Q4[7]};
    assign R52 = R51[8] ? (R51 + D_extended) : (R51 + D_comp);
    assign Q5  = {Q4[6:0], !R52[8]};

    // Stage 6:
    wire [7:0] Q6;
    wire [8:0] R61, R62;
    assign R61 = {R52[7:0], Q5[7]};
    assign R62 = R61[8] ? (R61 + D_extended) : (R61 + D_comp);
    assign Q6  = {Q5[6:0], !R62[8]};

    // Stage 7:
    wire [7:0] Q7;
    wire [8:0] R71, R72;
    assign R71 = {R62[7:0], Q6[7]};
    assign R72 = R71[8] ? (R71 + D_extended) : (R71 + D_comp);
    assign Q7  = {Q6[6:0], !R72[8]};

    // Stage 8:
    wire [7:0] Q8;
    wire [8:0] R81, R82;
    assign R81 = {R72[7:0], Q7[7]};
    assign R82 = R81[8] ? (R81 + D_extended) : (R81 + D_comp);
    assign Q8  = {Q7[6:0], !R82[8]};

    // Final Outputs
    assign Q = Q8;
    assign R = R82[8] ? (R82 + D_extended) : R82;

endmodule