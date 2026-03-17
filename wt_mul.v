`include "csa.v"
module wt_mul(A,B,Out);
  input [7:0] A;
  input [7:0] B;
  output [16:0] Out;

  wire [15:0] partial0;
  wire [15:0] partial1;
  wire [15:0] partial2;
  wire [15:0] partial3;
  wire [15:0] partial4;
  wire [15:0] partial5;
  wire [15:0] partial6;
  wire [15:0] partial7;
  wire [15:0] Sum1, Carry1;
  wire [15:0] Sum2, Carry2;
  wire [15:0] Sum3, Carry3;
  wire [15:0] Sum4, Carry4;
  wire [15:0] Sum5, Carry5;
  wire [15:0] Sum6, Carry6;
  
  //Generating partial products
  assign partial0[15:0] = (B[0]) ? {8'b0,A} : 16'b0;
  assign partial1[15:0] = (B[1]) ? {7'b0,A,1'b0} : 16'b0;
  assign partial2[15:0] = (B[2]) ? {6'b0,A,2'b0} : 16'b0;
  assign partial3[15:0] = (B[3]) ? {5'b0,A,3'b0} : 16'b0;
  assign partial4[15:0] = (B[4]) ? {4'b0,A,4'b0} : 16'b0;
  assign partial5[15:0] = (B[5]) ? {3'b0,A,5'b0} : 16'b0;
  assign partial6[15:0] = (B[6]) ? {2'b0,A,6'b0} : 16'b0;
  assign partial7[15:0] = (B[7]) ? {1'b0,A,7'b0} : 16'b0;

  //Implemementing the Wallace tree
  csa16 csa1(partial0,partial1,partial2,Sum1,Carry1);
  csa16 csa2(partial3,partial4,partial5,Sum2,Carry2);
  csa16 csa3(partial6,partial7,Carry2,Sum3,Carry3);
  csa16 csa4(Sum1, {Carry1[14:0], 1'b0}, Sum2, Sum4, Carry4);
  csa16 csa5(Sum4, {Carry4[14:0], 1'b0}, Sum3, Sum5, Carry5);
  csa16 csa6(Sum5, {Carry5[14:0], 1'b0}, {Carry3[14:0], 1'b0}, Sum6, Carry6);
  c_s_a c_s_a1(Sum6, {Carry6[14:0], 1'b0}, Out);
  
endmodule