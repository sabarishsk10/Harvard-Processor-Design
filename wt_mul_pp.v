`include "csa.v"
module wt_mul_pp(A, B, Out, clk, rst);
  input [7:0] A;
  input [7:0] B;
  input clk;
  input rst;
  output reg [16:0] Out;

  wire [15:0] partial0, partial1, partial2, partial3;
  wire [15:0] partial4, partial5, partial6, partial7;

  // Partial products
  assign partial0 = B[0] ? {8'b0,A} : 16'b0;
  assign partial1 = B[1] ? {7'b0,A,1'b0} : 16'b0;
  assign partial2 = B[2] ? {6'b0,A,2'b0} : 16'b0;
  assign partial3 = B[3] ? {5'b0,A,3'b0} : 16'b0;
  assign partial4 = B[4] ? {4'b0,A,4'b0} : 16'b0;
  assign partial5 = B[5] ? {3'b0,A,5'b0} : 16'b0;
  assign partial6 = B[6] ? {2'b0,A,6'b0} : 16'b0;
  assign partial7 = B[7] ? {1'b0,A,7'b0} : 16'b0;

  //Stage 1
  wire [15:0] Sum1_w, Carry1_w, Sum2_w, Carry2_w, Sum3_w, Carry3_w, Sum4_w, Carry4_w;
  reg [15:0] A1, B1, Sum3, Carry3, Sum4, Carry4;
  
  csa16 csa1(partial0, partial1, partial2, Sum1_w, Carry1_w);
  csa16 csa2(partial3, partial4, partial5, Sum2_w, Carry2_w);
  csa16 csa3(Sum1_w, {Carry1_w[14:0], 1'b0}, Sum2_w, Sum3_w, Carry3_w);
  csa16 csa4({Carry2_w[14:0], 1'b0}, partial6, partial7, Sum4_w, Carry4_w);

  always @(posedge clk or posedge rst) 
    begin
        if (rst)
            begin
                A1 <= 0;
                B1 <= 0;
                Sum3 <= 0; 
                Carry3 <= 0; 
                Sum4 <= 0; 
                Carry4 <= 0;

            end 
        else 
            begin
                Sum3 <= Sum3_w; 
                Carry3 <= Carry3_w;
                Sum4 <= Sum4_w; 
                Carry4 <= Carry4_w;
            end
    end

  //Stage 2
  wire [15:0] Sum5_w, Carry5_w, Sum6_w, Carry6_w;
  reg [15:0] A2, B2, Sum6, Carry6;

  csa16 csa5(Sum3, {Carry3[14:0], 1'b0}, Sum4, Sum5_w, Carry5_w);
  csa16 csa6(Sum5_w, {Carry5_w[14:0], 1'b0}, {Carry4[14:0], 1'b0}, Sum6_w, Carry6_w);

  always @(posedge clk or posedge rst)
    begin
        if (rst)
            begin
                A2 <= 0;
                B2 <= 0;
                Sum6 <= 0;
                Carry6 <= 0;
            end 
        else
            begin
                Sum6 <= Sum6_w;
                Carry6 <= Carry6_w;
            end
    end

  //Stage 3 Final Addition

  wire [16:0] Out_w;
  wire C_out_w;

  c_s_a final_adder(Sum6, {Carry6[14:0], 1'b0}, Out_w);

  always @(posedge clk or posedge rst) 
    begin
        if (rst)
            begin
                Out <= 0;
            end 
        else 
            begin
                Out <= Out_w[16:0];
            end
    end

endmodule