module rba_pp(A,B,clk,rst,Out);

input [7:0] A,B;
input clk,rst;
output reg [8:0] Out;

//Assigning the kpg values using the inputs

reg [7:0] A0,B0;
reg [17:0] kpg;

always @ (posedge clk)
    begin
        if (rst)
            begin
                A0 <= 0;
                B0 <= 0;
                kpg <= 0;
            end

        else
            begin
                kpg[1:0] <= 2'b00;
                kpg[3:2] <= {B[0],A[0]};
                kpg[5:4] <= {B[1],A[1]};
                kpg[7:6] <= {B[2],A[2]};
                kpg[9:8] <= {B[3],A[3]};  
                kpg[11:10] <= {B[4],A[4]};
                kpg[13:12] <= {B[5],A[5]};
                kpg[15:14] <= {B[6],A[6]};
                kpg[17:16] <= {B[7],A[7]};

                A0 <= A;
                B0 <= B;
            end
    end


//Stage 1

reg [17:0] kpg1;
reg [7:0] A1,B1;
wire [15:0] S1_Out;

four_to_one_mux m1(kpg[1:0],kpg[3:2],S1_Out[3:2]);
four_to_one_mux m2(kpg[3:2],kpg[5:4],S1_Out[5:4]);
four_to_one_mux m3(kpg[5:4],kpg[7:6],S1_Out[7:6]);
four_to_one_mux m4(kpg[7:6],kpg[9:8],S1_Out[9:8]);
four_to_one_mux m5(kpg[9:8],kpg[11:10],S1_Out[11:10]);
four_to_one_mux m6(kpg[11:10],kpg[13:12],S1_Out[13:12]);
four_to_one_mux m7(kpg[13:12],kpg[15:14],S1_Out[15:14]);
 always @ (posedge clk)
    begin
        if (rst)
            begin
                kpg1 <= 0;
                A1 <= 0;
                B1 <= 0;
            end

        else
            begin
                kpg1 <= {kpg[17:16],S1_Out[15:2],kpg[1:0]};
                A1 <= A0;
                B1 <= B0;
            end
    end


//Stage 2

reg [17:0] kpg2;
reg [7:0] A2,B2;
wire [15:0] S2_Out;

four_to_one_mux m8(kpg1[1:0],kpg1[5:4],S2_Out[5:4]);
four_to_one_mux m9(kpg1[1:0],kpg1[7:6],S2_Out[7:6]);
four_to_one_mux m10(kpg1[5:4],kpg1[9:8],S2_Out[9:8]);
four_to_one_mux m11(kpg1[7:6],kpg1[11:10],S2_Out[11:10]);
four_to_one_mux m12(kpg1[9:8],kpg1[13:12],S2_Out[13:12]);
four_to_one_mux m13(kpg1[11:10],kpg1[15:14],S2_Out[15:14]);

always @ (posedge clk)
    begin
        if (rst)
            begin
                kpg2 <= 0;
                A2 <= 0;
                B2 <= 0;
            end

        else 
            begin
                kpg2 <= {kpg1[17:16],S2_Out[15:4],kpg1[3:0]};
                A2 <= A1;
                B2 <= B1;
            end
    end


//Stage 3

reg [17:0] kpg3;
reg [7:0] A3,B3;
wire [15:0] S3_Out;

four_to_one_mux m14(kpg2[1:0],kpg2[9:8],S3_Out[9:8]);
four_to_one_mux m15(kpg2[3:2],kpg2[11:10],S3_Out[11:10]);
four_to_one_mux m16(kpg2[5:4],kpg2[13:12],S3_Out[13:12]);
four_to_one_mux m17(kpg2[7:6],kpg2[15:14],S3_Out[15:14]);

always @ (posedge clk)
    begin
        if (rst)
            begin
                kpg3 <= 0;
                A3 <= 0;
                B3 <= 0;
            end

        else
            begin
                kpg3 <= {kpg2[17:16],S3_Out[15:8],kpg2[7:0]};
                A3 <= A2;
                B3 <= B2;
            end
    end


//Final stage

reg [7:0] kpg4;

always @ (posedge clk)
    begin
        if (rst)
            begin
                kpg4 <= 0;
                Out <= 0;
            end

        else
            begin
                //Changing the 2-bits to 1-bit
                kpg4[0] <= kpg3[0];
                kpg4[1] <= kpg3[2];
                kpg4[2] <= kpg3[4];
                kpg4[3] <= kpg3[6];
                kpg4[4] <= kpg3[8];
                kpg4[5] <= kpg3[10];
                kpg4[6] <= kpg3[12];
                kpg4[7] <= kpg3[14];

                //XOR operation
                Out[0] <= A3[0]^B3[0]^kpg4[0];
                Out[1] <= A3[1]^B3[1]^kpg4[1];
                Out[2] <= A3[2]^B3[2]^kpg4[2];
                Out[3] <= A3[3]^B3[3]^kpg4[3];
                Out[4] <= A3[4]^B3[4]^kpg4[4];
                Out[5] <= A3[5]^B3[5]^kpg4[5];
                Out[6] <= A3[6]^B3[6]^kpg4[6];
                Out[7] <= A3[7]^B3[7]^kpg4[7];

                //Generating carry out
                if (kpg3[17:16] == 2'b00)
                    begin
                        Out[8] <= 1'b0;
                    end
                else if (kpg3[17:16] == 2'b11)
                    begin
                        Out[8] <= 1'b1;
                    end
                else
                    begin
                        Out[8] <= kpg4[7];
                    end
            end
    end

endmodule