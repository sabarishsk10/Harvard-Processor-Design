module two_to_one_mux_rs_pp(In1, In2, Sel, Out);

input In1, In2;
output Out;
input Sel;

assign Out = (Sel) ? In1 : In2;

endmodule


module log_right_shift_pp(In ,Out ,Sel, clk, rst);

input [7:0] In;
input [2:0] Sel;
output reg [7:0] Out;3
input clk, rst;

//Stage-1
reg [2:0] Sel1;
wire [7:0] S1_out_w;
reg [7:0] S1_out_r;

two_to_one_mux_rs_pp s11(1'b0,In[7],Sel[0],S1_out_w[7]);
two_to_one_mux_rs_pp s12(In[7],In[6],Sel[0],S1_out_w[6]);
two_to_one_mux_rs_pp s13(In[6],In[5],Sel[0],S1_out_w[5]);
two_to_one_mux_rs_pp s14(In[5],In[4],Sel[0],S1_out_w[4]);
two_to_one_mux_rs_pp s15(In[4],In[3],Sel[0],S1_out_w[3]);
two_to_one_mux_rs_pp s16(In[3],In[2],Sel[0],S1_out_w[2]);
two_to_one_mux_rs_pp s17(In[2],In[1],Sel[0],S1_out_w[1]);
two_to_one_mux_rs_pp s18(In[1],In[0],Sel[0],S1_out_w[0]);

always @(posedge clk or posedge rst) 
    begin
        if(rst) 
            begin
                Sel1 <= 3'b0;
                S1_out_r <= 8'b0;
            end 
        else 
            begin
                Sel1 <= Sel;
                S1_out_r <= S1_out_w;
            end
    end

//Stage-2
reg [2:0] Sel2;
wire [7:0] S2_out_w;
reg [7:0] S2_out_r;

two_to_one_mux_rs_pp s21(1'b0,S1_out_r[7],Sel1[1],S2_out_w[7]);
two_to_one_mux_rs_pp s22(1'b0,S1_out_r[6],Sel1[1],S2_out_w[6]);
two_to_one_mux_rs_pp s23(S1_out_r[7],S1_out_r[5],Sel1[1],S2_out_w[5]);
two_to_one_mux_rs_pp s24(S1_out_r[6],S1_out_r[4],Sel1[1],S2_out_w[4]);
two_to_one_mux_rs_pp s25(S1_out_r[5],S1_out_r[3],Sel1[1],S2_out_w[3]);
two_to_one_mux_rs_pp s26(S1_out_r[4],S1_out_r[2],Sel1[1],S2_out_w[2]);
two_to_one_mux_rs_pp s27(S1_out_r[3],S1_out_r[1],Sel1[1],S2_out_w[1]);
two_to_one_mux_rs_pp s28(S1_out_r[2],S1_out_r[0],Sel1[1],S2_out_w[0]);

always @(posedge clk or posedge rst) 
    begin
        if(rst) 
            begin
                Sel2 <= 3'b0;
                S2_out_r <= 8'b0;
            end 
        else 
            begin
                Sel2 <= Sel1;
                S2_out_r <= S2_out_w;
            end
    end

//Stage-3
wire [7:0] S3_out_w;

two_to_one_mux_rs_pp s31(1'b0,S2_out_r[7],Sel2[2],S3_out_w[7]);
two_to_one_mux_rs_pp s32(1'b0,S2_out_r[6],Sel2[2],S3_out_w[6]);
two_to_one_mux_rs_pp s33(1'b0,S2_out_r[5],Sel2[2],S3_out_w[5]);
two_to_one_mux_rs_pp s34(1'b0,S2_out_r[4],Sel2[2],S3_out_w[4]);
two_to_one_mux_rs_pp s35(S2_out_r[7],S2_out_r[3],Sel2[2],S3_out_w[3]);
two_to_one_mux_rs_pp s36(S2_out_r[6],S2_out_r[2],Sel2[2],S3_out_w[2]);
two_to_one_mux_rs_pp s37(S2_out_r[5],S2_out_r[1],Sel2[2],S3_out_w[1]);
two_to_one_mux_rs_pp s38(S2_out_r[4],S2_out_r[0],Sel2[2],S3_out_w[0]);

always @(posedge clk or posedge rst) 
    begin
        if(rst) 
            begin
                Out <= 8'b0;
            end 
        else 
            begin
                Out <= S3_out_w;
            end
    end

endmodule