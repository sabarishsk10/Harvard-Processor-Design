`include "rba_add.v"
module csa16(X, Y, Z, Sum, Carry);

  input  [15:0] X, Y, Z;
  output [15:0] Sum;
  output [15:0] Carry;

  assign Sum   = X ^ Y ^ Z;
  assign Carry = (X & Y) | (Y & Z) | (Z & X);

endmodule


module c_s_a(X, Y, Out);
  
  input  [15:0] X, Y;
  output [16:0] Out;

  wire [8:0] SumL;
  wire [8:0] SumH0, SumH1;

  rba_add rba_low(X[7:0],  Y[7:0],  SumL);
  rba_add rba_high0(X[15:8], Y[15:8], SumH0);
  rba_add rba_high1(X[15:8], Y[15:8] + 8'b1, SumH1);

  wire [8:0] SumH = (SumL[8]) ? SumH1 : SumH0;

  assign Out = {SumH, SumL[7:0]};

endmodule