module two_to_one_mux_ls(In1, In2, Sel, Out);

input In1, In2;
output Out;
input Sel;

assign Out = (Sel) ? In1 : In2;

endmodule


module log_left_shift(In ,Out ,Sel);

input [7:0] In;
input [2:0] Sel;
output [7:0] Out;

//Stage-1
wire [7:0] S1_out;

two_to_one_mux_ls s11(1'b0,In[0],Sel[0],S1_out[0]);
two_to_one_mux_ls s12(In[0],In[1],Sel[0],S1_out[1]);
two_to_one_mux_ls s13(In[1],In[2],Sel[0],S1_out[2]);
two_to_one_mux_ls s14(In[2],In[3],Sel[0],S1_out[3]);
two_to_one_mux_ls s15(In[3],In[4],Sel[0],S1_out[4]);
two_to_one_mux_ls s16(In[4],In[5],Sel[0],S1_out[5]);
two_to_one_mux_ls s17(In[5],In[6],Sel[0],S1_out[6]);
two_to_one_mux_ls s18(In[6],In[7],Sel[0],S1_out[7]);

//Stage-2
wire [7:0] S2_out;

two_to_one_mux_ls s21(1'b0,S1_out[0],Sel[1],S2_out[0]);
two_to_one_mux_ls s22(1'b0,S1_out[1],Sel[1],S2_out[1]);
two_to_one_mux_ls s23(S1_out[0],S1_out[2],Sel[1],S2_out[2]);
two_to_one_mux_ls s24(S1_out[1],S1_out[3],Sel[1],S2_out[3]);
two_to_one_mux_ls s25(S1_out[2],S1_out[4],Sel[1],S2_out[4]);
two_to_one_mux_ls s26(S1_out[3],S1_out[5],Sel[1],S2_out[5]);
two_to_one_mux_ls s27(S1_out[4],S1_out[6],Sel[1],S2_out[6]);
two_to_one_mux_ls s28(S1_out[5],S1_out[7],Sel[1],S2_out[7]);

//Stage-3
two_to_one_mux_ls s31(1'b0,S2_out[0],Sel[2],Out[0]);
two_to_one_mux_ls s32(1'b0,S2_out[1],Sel[2],Out[1]);
two_to_one_mux_ls s33(1'b0,S2_out[2],Sel[2],Out[2]);
two_to_one_mux_ls s34(1'b0,S2_out[3],Sel[2],Out[3]);
two_to_one_mux_ls s35(S2_out[0],S2_out[4],Sel[2],Out[4]);
two_to_one_mux_ls s36(S2_out[1],S2_out[5],Sel[2],Out[5]);
two_to_one_mux_ls s37(S2_out[2],S2_out[6],Sel[2],Out[6]);
two_to_one_mux_ls s38(S2_out[3],S2_out[7],Sel[2],Out[7]);

endmodule