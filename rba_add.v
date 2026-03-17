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


module rba_add(A,B,Out);

input [7:0] A,B; 
output [8:0] Out;
wire [17:0] kpg,kpg3;
wire [15:0] kpg1,kpg2;
wire [8:0] kpg4;

//Assigning kpg values from the inputs
assign kpg[1:0] = 2'b00;
assign kpg[3:2] = {B[0],A[0]};
assign kpg[5:4] = {B[1],A[1]};
assign kpg[7:6] = {B[2],A[2]};
assign kpg[9:8] = {B[3],A[3]};  
assign kpg[11:10] = {B[4],A[4]};
assign kpg[13:12] = {B[5],A[5]};
assign kpg[15:14] = {B[6],A[6]};
assign kpg[17:16] = {B[7],A[7]};

//STAGE 1
assign kpg1[1:0] = kpg[1:0];
four_to_one_mux m1(kpg[1:0],kpg[3:2],kpg1[3:2]);
four_to_one_mux m2(kpg[3:2],kpg[5:4],kpg1[5:4]);
four_to_one_mux m3(kpg[5:4],kpg[7:6],kpg1[7:6]);
four_to_one_mux m4(kpg[7:6],kpg[9:8],kpg1[9:8]);
four_to_one_mux m5(kpg[9:8],kpg[11:10],kpg1[11:10]);
four_to_one_mux m6(kpg[11:10],kpg[13:12],kpg1[13:12]);
four_to_one_mux m7(kpg[13:12],kpg[15:14],kpg1[15:14]);

//STAGE 2
assign kpg2[1:0] = kpg1[1:0];
assign kpg2[3:2] = kpg1[3:2];
four_to_one_mux m8(kpg1[1:0],kpg1[5:4],kpg2[5:4]);
four_to_one_mux m9(kpg1[1:0],kpg1[7:6],kpg2[7:6]);
four_to_one_mux m10(kpg1[5:4],kpg1[9:8],kpg2[9:8]);
four_to_one_mux m11(kpg1[7:6],kpg1[11:10],kpg2[11:10]);
four_to_one_mux m12(kpg1[9:8],kpg1[13:12],kpg2[13:12]);
four_to_one_mux m13(kpg1[11:10],kpg1[15:14],kpg2[15:14]);

//STAGE 3
assign kpg3[1:0] = kpg2[1:0];
assign kpg3[3:2] = kpg2[3:2];
assign kpg3[5:4] = kpg2[5:4];
assign kpg3[7:6] = kpg2[7:6];
four_to_one_mux m14(kpg2[1:0],kpg2[9:8],kpg3[9:8]);
four_to_one_mux m15(kpg2[3:2],kpg2[11:10],kpg3[11:10]);
four_to_one_mux m16(kpg2[5:4],kpg2[13:12],kpg3[13:12]);
four_to_one_mux m17(kpg2[7:6],kpg2[15:14],kpg3[15:14]);

//Checking the carry out
four_to_one_mux m18(kpg3[15:14],kpg[17:16],kpg3[17:16]);

//Coverting 2 bits to 1 bit
assign kpg4[0] = kpg3[0];
assign kpg4[1] = kpg3[2];
assign kpg4[2] = kpg3[4];
assign kpg4[3] = kpg3[6];
assign kpg4[4] = kpg3[8];
assign kpg4[5] = kpg3[10];
assign kpg4[6] = kpg3[12];
assign kpg4[7] = kpg3[14];
assign kpg4[8] = kpg3[16];

//XOR operation
assign Out[0] = A[0]^B[0]^kpg4[0];
assign Out[1] = A[1]^B[1]^kpg4[1];
assign Out[2] = A[2]^B[2]^kpg4[2];
assign Out[3] = A[3]^B[3]^kpg4[3];
assign Out[4] = A[4]^B[4]^kpg4[4];
assign Out[5] = A[5]^B[5]^kpg4[5];
assign Out[6] = A[6]^B[6]^kpg4[6];
assign Out[7] = A[7]^B[7]^kpg4[7];                       
assign Out[8] = kpg4[8];

endmodule