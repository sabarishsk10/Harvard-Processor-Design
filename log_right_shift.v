module two_to_one_mux_rs(In1, In2, Sel, Out);

input In1, In2;
output Out;
input Sel;

assign Out = (Sel) ? In1 : In2;

endmodule


module log_right_shift(In ,Out ,Sel);

input [7:0] In;
input [2:0] Sel;
output [7:0] Out;

//Stage-1
wire [7:0] S1_out;

two_to_one_mux_rs s11(1'b0,In[7],Sel[0],S1_out[7]);
two_to_one_mux_rs s12(In[7],In[6],Sel[0],S1_out[6]);
two_to_one_mux_rs s13(In[6],In[5],Sel[0],S1_out[5]);
two_to_one_mux_rs s14(In[5],In[4],Sel[0],S1_out[4]);
two_to_one_mux_rs s15(In[4],In[3],Sel[0],S1_out[3]);
two_to_one_mux_rs s16(In[3],In[2],Sel[0],S1_out[2]);
two_to_one_mux_rs s17(In[2],In[1],Sel[0],S1_out[1]);
two_to_one_mux_rs s18(In[1],In[0],Sel[0],S1_out[0]);

//Stage-2
wire [7:0] S2_out;

two_to_one_mux_rs s21(1'b0,S1_out[7],Sel[1],S2_out[7]);
two_to_one_mux_rs s22(1'b0,S1_out[6],Sel[1],S2_out[6]);
two_to_one_mux_rs s23(S1_out[7],S1_out[5],Sel[1],S2_out[5]);
two_to_one_mux_rs s24(S1_out[6],S1_out[4],Sel[1],S2_out[4]);
two_to_one_mux_rs s25(S1_out[5],S1_out[3],Sel[1],S2_out[3]);
two_to_one_mux_rs s26(S1_out[4],S1_out[2],Sel[1],S2_out[2]);
two_to_one_mux_rs s27(S1_out[3],S1_out[1],Sel[1],S2_out[1]);
two_to_one_mux_rs s28(S1_out[2],S1_out[0],Sel[1],S2_out[0]);

//Stage-3
two_to_one_mux_rs s31(1'b0,S2_out[7],Sel[2],Out[7]);
two_to_one_mux_rs s32(1'b0,S2_out[6],Sel[2],Out[6]);
two_to_one_mux_rs s33(1'b0,S2_out[5],Sel[2],Out[5]);
two_to_one_mux_rs s34(1'b0,S2_out[4],Sel[2],Out[4]);
two_to_one_mux_rs s35(S2_out[7],S2_out[3],Sel[2],Out[3]);
two_to_one_mux_rs s36(S2_out[6],S2_out[2],Sel[2],Out[2]);
two_to_one_mux_rs s37(S2_out[5],S2_out[1],Sel[2],Out[1]);
two_to_one_mux_rs s38(S2_out[4],S2_out[0],Sel[2],Out[0]);

endmodule