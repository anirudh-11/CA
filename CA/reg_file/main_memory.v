`include "dff_8.v"

`include "decoder_5_to_32.v"

`include "mux_1x8.v"

module memory(read_add_1, read_add_2, clk, write_add, read_out_1, read_out_2, write_inp, mode);
input [4 : 0] read_add_1, read_add_2, write_add;
input [7 : 0] write_inp;
input clk, mode;
reg [7 : 0] m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13, m14, m15, m16, m17, m18, m19, m20, m21, m22, m23, m24, m25, m26, m27, m28, m29, m30, m31, m0;
output [7 : 0] read_out_1, read_out_2;

wire [7 : 0] temp_read_1, temp_read_2;
wire [31 : 0] decoded_read_add_1, decoded_read_add_2, decoded_write_add;

wire [7 : 0] memory1, memory2, memory3, memory4, memory5, memory6, memory7, memory8, memory9, memory10, memory11, memory12, memory13, memory14, memory15, memory16, memory17, memory18, memory19, memory20, memory21, memory22, memory23, memory24, memory25, memory26, memory27, memory28, memory29, memory30, memory31, memory0;

reg clk1;
reg [7 : 0]inp;
initial 
begin
    clk1 = 0;
    forever #5 clk1 = ~clk1;
end

initial 
#100 $finish;

initial
forever
begin
    #10
    inp = {$random} % 256;
end

assign read_add_1 = 5'b01011;
assign read_add_2 = 5'b00111;
assign write_add = 5'b00110;
assign write_inp = 8'b11001100;
assign mode = 1'b1;
always@(*)
begin
    m7 = 8'b00100011;
    m11 = 8'b00111001;
    $display("temp1 = %b, r1 = %b, temp2 = %b, r2 = %b. m[] = %b", read_out_1, decoded_read_add_1, read_out_2, decoded_read_add_2, m6);
end
decoder_5_to_32 r1(read_add_1, decoded_read_add_1);
decoder_5_to_32 r2(read_add_2, decoded_read_add_2);
decoder_5_to_32 w(write_add, decoded_write_add);

generate
    genvar i;
    for(i = 0; i < 8; i = i + 1)
    begin : gen1
        assign read_out_2[i] = (m0[i] & decoded_read_add_2[0]) | (m1[i] & decoded_read_add_2[1]) | (m2[i] & decoded_read_add_2[2]) | (m3[i] & decoded_read_add_2[3]) | (m4[i] & decoded_read_add_2[4]) | (m5[i] & decoded_read_add_2[5]) | (m6[i] & decoded_read_add_2[6]) | (m7[i] & decoded_read_add_2[7]) | (m8[i] & decoded_read_add_2[8]) | (m9[i] & decoded_read_add_2[9]) | (m10[i] & decoded_read_add_2[10]) | (m12[i] & decoded_read_add_2[12]) | (m13[i] & decoded_read_add_2[13]) | (m14[i] & decoded_read_add_2[14]) | (m15[i] & decoded_read_add_2[15]) | (m16[i] & decoded_read_add_2[16]) | (m17[i] & decoded_read_add_2[17]) | (m18[i] & decoded_read_add_2[18]) | (m19[i] & decoded_read_add_2[19]) | (m20[i] & decoded_read_add_2[20]) | (m21[i] & decoded_read_add_2[21]) | (m22[i] & decoded_read_add_2[22]) | (m23[i] & decoded_read_add_2[23]) | (m24[i] & decoded_read_add_2[24]) | (m25[i] & decoded_read_add_2[25]) | (m26[i] & decoded_read_add_2[26]) | (m27[i] & decoded_read_add_2[27]) | (m28[i] & decoded_read_add_2[28]) | (m29[i] & decoded_read_add_2[29]) | (m30[i] & decoded_read_add_2[30]) | (m31[i] & decoded_read_add_2[31]) | (m11[i] & decoded_read_add_2[11]);
    end
endgenerate

generate
    genvar j;
    for(j = 0; j < 8; j = j + 1)
    begin : gen2
        assign read_out_1[j] = (m0[j] & decoded_read_add_1[0]) | (m1[j] & decoded_read_add_1[1]) | (m2[j] & decoded_read_add_1[2]) | (m3[j] & decoded_read_add_1[3]) | (m4[j] & decoded_read_add_1[4]) | (m5[j] & decoded_read_add_1[5]) | (m6[j] & decoded_read_add_1[6]) | (m7[j] & decoded_read_add_1[7]) | (m8[j] & decoded_read_add_1[8]) | (m9[j] & decoded_read_add_1[9]) | (m10[j] & decoded_read_add_1[10]) | (m12[j] & decoded_read_add_1[12]) | (m13[j] & decoded_read_add_1[13]) | (m14[j] & decoded_read_add_1[14]) | (m15[j] & decoded_read_add_1[15]) | (m16[j] & decoded_read_add_1[16]) | (m17[j] & decoded_read_add_1[17]) | (m18[j] & decoded_read_add_1[18]) | (m19[j] & decoded_read_add_1[19]) | (m20[j] & decoded_read_add_1[20]) | (m21[j] & decoded_read_add_1[21]) | (m22[j] & decoded_read_add_1[22]) | (m23[j] & decoded_read_add_1[23]) | (m24[j] & decoded_read_add_1[24]) | (m25[j] & decoded_read_add_1[25]) | (m26[j] & decoded_read_add_1[26]) | (m27[j] & decoded_read_add_1[27]) | (m28[j] & decoded_read_add_1[28]) | (m29[j] & decoded_read_add_1[29]) | (m30[j] & decoded_read_add_1[30]) | (m31[j] & decoded_read_add_1[31]) | (m11[j] & decoded_read_add_1[11]);
    end
endgenerate

// mux_1x8 w0(m0, write_inp, memory0, decoded_write_add[0],clk1);
// mux_1x8 w1(m1, write_inp, memory1, decoded_write_add[1],clk1);
// mux_1x8 w2(m2, write_inp, memory2, decoded_write_add[2],clk1);
// mux_1x8 w3(m3, write_inp, memory3, decoded_write_add[3],clk1);
// mux_1x8 w4(m4, write_inp, memory4, decoded_write_add[4],clk1);
// mux_1x8 w5(m5, write_inp, memory5, decoded_write_add[5],clk1);
// mux_1x8 w6(m6, write_inp, memory6, decoded_write_add[6],clk1);
// mux_1x8 w7(m7, write_inp, memory7, decoded_write_add[7],clk1);
// mux_1x8 w8(m8, write_inp, memory8, decoded_write_add[8],clk1);
// mux_1x8 w9(m9, write_inp, memory9, decoded_write_add[9],clk1);
// mux_1x8 w10(m10, write_inp, memory10, decoded_write_add[10],clk1);
// mux_1x8 w11(m11, write_inp, memory11, decoded_write_add[11],clk1);
// mux_1x8 w12(m12, write_inp, memory12, decoded_write_add[12],clk1);
// mux_1x8 w13(m13, write_inp, memory13, decoded_write_add[13],clk1);
// mux_1x8 w14(m14, write_inp, memory14, decoded_write_add[14],clk1);
// mux_1x8 w15(m15, write_inp, memory15, decoded_write_add[15],clk1);
// mux_1x8 w16(m16, write_inp, memory16, decoded_write_add[16],clk1);
// mux_1x8 w17(m17, write_inp, memory17, decoded_write_add[17],clk1);
// mux_1x8 w18(m18, write_inp, memory18, decoded_write_add[18],clk1);
// mux_1x8 w19(m19, write_inp, memory19, decoded_write_add[19],clk1);
// mux_1x8 w20(m20, write_inp, memory20, decoded_write_add[20],clk1);
// mux_1x8 w21(m21, write_inp, memory21, decoded_write_add[21],clk1);
// mux_1x8 w22(m22, write_inp, memory22, decoded_write_add[22],clk1);
// mux_1x8 w23(m23, write_inp, memory23, decoded_write_add[23],clk1);
// mux_1x8 w24(m24, write_inp, memory24, decoded_write_add[24],clk1);
// mux_1x8 w25(m25, write_inp, memory25, decoded_write_add[25],clk1);
// mux_1x8 w26(m26, write_inp, memory26, decoded_write_add[26],clk1);
// mux_1x8 w27(m27, write_inp, memory27, decoded_write_add[27],clk1);
// mux_1x8 w28(m29, write_inp, memory28, decoded_write_add[28],clk1);
// mux_1x8 w29(m29, write_inp, memory29, decoded_write_add[29],clk1);
// mux_1x8 w30(m30, write_inp, memory30, decoded_write_add[30],clk1);
// mux_1x8 w31(m31, write_inp, memory31, decoded_write_add[31],clk1);

mux_1x8 w0(m0, inp, memory0, decoded_write_add[0],clk1);
mux_1x8 w1(m1, inp, memory1, decoded_write_add[1],clk1);
mux_1x8 w2(m2, inp, memory2, decoded_write_add[2],clk1);
mux_1x8 w3(m3, inp, memory3, decoded_write_add[3],clk1);
mux_1x8 w4(m4, inp, memory4, decoded_write_add[4],clk1);
mux_1x8 w5(m5, inp, memory5, decoded_write_add[5],clk1);
mux_1x8 w6(m6, inp, memory6, decoded_write_add[6],clk1);
mux_1x8 w7(m7, inp, memory7, decoded_write_add[7],clk1);
mux_1x8 w8(m8, inp, memory8, decoded_write_add[8],clk1);
mux_1x8 w9(m9, inp, memory9, decoded_write_add[9],clk1);
mux_1x8 w10(m10, inp, memory10, decoded_write_add[10],clk1);
mux_1x8 w11(m11, inp, memory11, decoded_write_add[11],clk1);
mux_1x8 w12(m12, inp, memory12, decoded_write_add[12],clk1);
mux_1x8 w13(m13, inp, memory13, decoded_write_add[13],clk1);
mux_1x8 w14(m14, inp, memory14, decoded_write_add[14],clk1);
mux_1x8 w15(m15, inp, memory15, decoded_write_add[15],clk1);
mux_1x8 w16(m16, inp, memory16, decoded_write_add[16],clk1);
mux_1x8 w17(m17, inp, memory17, decoded_write_add[17],clk1);
mux_1x8 w18(m18, inp, memory18, decoded_write_add[18],clk1);
mux_1x8 w19(m19, inp, memory19, decoded_write_add[19],clk1);
mux_1x8 w20(m20, inp, memory20, decoded_write_add[20],clk1);
mux_1x8 w21(m21, inp, memory21, decoded_write_add[21],clk1);
mux_1x8 w22(m22, inp, memory22, decoded_write_add[22],clk1);
mux_1x8 w23(m23, inp, memory23, decoded_write_add[23],clk1);
mux_1x8 w24(m24, inp, memory24, decoded_write_add[24],clk1);
mux_1x8 w25(m25, inp, memory25, decoded_write_add[25],clk1);
mux_1x8 w26(m26, inp, memory26, decoded_write_add[26],clk1);
mux_1x8 w27(m27, inp, memory27, decoded_write_add[27],clk1);
mux_1x8 w28(m29, inp, memory28, decoded_write_add[28],clk1);
mux_1x8 w29(m29, inp, memory29, decoded_write_add[29],clk1);
mux_1x8 w30(m30, inp, memory30, decoded_write_add[30],clk1);
mux_1x8 w31(m31, inp, memory31, decoded_write_add[31],clk1);





always@(*)
begin
    m0 = memory0;
    m1 = memory1;
    m2 = memory2;
    m3 = memory3;
    m4 = memory4;
    m5 = memory5;
    m6 = memory6;
    m7 = memory7;
    m8 = memory8;
    m9 = memory9;
    m10 = memory10;
    m11 = memory11;
    m12 = memory12;
    m13 = memory13;
    m14 = memory14;
    m15 = memory15;
    m16 = memory16;
    m17 = memory17;
    m18 = memory18;
    m19 = memory19;
    m20 = memory20;
    m21 = memory21;
    m22 = memory22;
    m23 = memory23;
    m24 = memory24;
    m25 = memory25;
    m26 = memory26;
    m27 = memory27;
    m28 = memory28;
    m29 = memory29;
    m30 = memory30;
    m31 = memory31;
end




endmodule