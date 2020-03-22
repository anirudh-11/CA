`include "two_compliment_16.v"

module mux_8(inputA, inputB, s1, s2, s3, out);

input s1, s2, s3;
input [15 : 0] inputA, inputB;
output [15 : 0] out;

// and   000
// or    001
// xor   010
// xnor  011
// nand  100
// nor   101
// not   110
// 2's compliment  111

// assign inputA = 16'b1111110011000011;
// assign inputB = 16'b1100111111001100;
// assign s1 = 1'b1;
// assign s2 = 1'b0;
// assign s3 = 1'b0;

// always@(*)
// begin
//   $display("%b\n%b\n%b", inputA, inputB, out);
// end



wire [15 : 0] temp;
bit2comp16 c1(inputA, temp);

assign out[0] = (((~s1 & ~s2 & ~s3) & inputA[0] & inputB[0]) | ((~s1 & ~s2 & s3) & (inputA[0] | inputB[0])) | ((~s1 & s2 & ~s3) & (inputA[0] ^ inputB[0])) | ((~s1 & s2 & s3) & ~(inputA[0] ^ inputB[0])) | ((s1 & ~s2 & ~s3) & ~(inputA[0] & inputB[0])) | ((s1 & ~s2 & s3) & ~(inputA[0] | inputB[0])) | ((s1 & s2 & ~s3) & ~(inputA[0])) | ((s1 & s2 & s3) & temp[0]));
assign out[1] = (((~s1 & ~s2 & ~s3) & inputA[1] & inputB[1]) | ((~s1 & ~s2 & s3) & (inputA[1] | inputB[1])) | ((~s1 & s2 & ~s3) & (inputA[1] ^ inputB[1])) | ((~s1 & s2 & s3) & ~(inputA[1] ^ inputB[1])) | ((s1 & ~s2 & ~s3) & ~(inputA[1] & inputB[1])) | ((s1 & ~s2 & s3) & ~(inputA[1] | inputB[1])) | ((s1 & s2 & ~s3) & ~(inputA[1])) | ((s1 & s2 & s3) & temp[1]));
assign out[2] = (((~s1 & ~s2 & ~s3) & inputA[2] & inputB[2]) | ((~s1 & ~s2 & s3) & (inputA[2] | inputB[2])) | ((~s1 & s2 & ~s3) & (inputA[2] ^ inputB[2])) | ((~s1 & s2 & s3) & ~(inputA[2] ^ inputB[2])) | ((s1 & ~s2 & ~s3) & ~(inputA[2] & inputB[2])) | ((s1 & ~s2 & s3) & ~(inputA[2] | inputB[2])) | ((s1 & s2 & ~s3) & ~(inputA[2])) | ((s1 & s2 & s3) & temp[2]));
assign out[3] = (((~s1 & ~s2 & ~s3) & inputA[3] & inputB[3]) | ((~s1 & ~s2 & s3) & (inputA[3] | inputB[3])) | ((~s1 & s2 & ~s3) & (inputA[3] ^ inputB[3])) | ((~s1 & s2 & s3) & ~(inputA[3] ^ inputB[3])) | ((s1 & ~s2 & ~s3) & ~(inputA[3] & inputB[3])) | ((s1 & ~s2 & s3) & ~(inputA[3] | inputB[3])) | ((s1 & s2 & ~s3) & ~(inputA[3])) | ((s1 & s2 & s3) & temp[3]));
assign out[4] = (((~s1 & ~s2 & ~s3) & inputA[4] & inputB[4]) | ((~s1 & ~s2 & s3) & (inputA[4] | inputB[4])) | ((~s1 & s2 & ~s3) & (inputA[4] ^ inputB[4])) | ((~s1 & s2 & s3) & ~(inputA[4] ^ inputB[4])) | ((s1 & ~s2 & ~s3) & ~(inputA[4] & inputB[4])) | ((s1 & ~s2 & s3) & ~(inputA[4] | inputB[4])) | ((s1 & s2 & ~s3) & ~(inputA[4])) | ((s1 & s2 & s3) & temp[4]));
assign out[5] = (((~s1 & ~s2 & ~s3) & inputA[5] & inputB[5]) | ((~s1 & ~s2 & s3) & (inputA[5] | inputB[5])) | ((~s1 & s2 & ~s3) & (inputA[5] ^ inputB[5])) | ((~s1 & s2 & s3) & ~(inputA[5] ^ inputB[5])) | ((s1 & ~s2 & ~s3) & ~(inputA[5] & inputB[5])) | ((s1 & ~s2 & s3) & ~(inputA[5] | inputB[5])) | ((s1 & s2 & ~s3) & ~(inputA[5])) | ((s1 & s2 & s3) & temp[5]));
assign out[6] = (((~s1 & ~s2 & ~s3) & inputA[6] & inputB[6]) | ((~s1 & ~s2 & s3) & (inputA[6] | inputB[6])) | ((~s1 & s2 & ~s3) & (inputA[6] ^ inputB[6])) | ((~s1 & s2 & s3) & ~(inputA[6] ^ inputB[6])) | ((s1 & ~s2 & ~s3) & ~(inputA[6] & inputB[6])) | ((s1 & ~s2 & s3) & ~(inputA[6] | inputB[6])) | ((s1 & s2 & ~s3) & ~(inputA[6])) | ((s1 & s2 & s3) & temp[6]));
assign out[7] = (((~s1 & ~s2 & ~s3) & inputA[7] & inputB[7]) | ((~s1 & ~s2 & s3) & (inputA[7] | inputB[7])) | ((~s1 & s2 & ~s3) & (inputA[7] ^ inputB[7])) | ((~s1 & s2 & s3) & ~(inputA[7] ^ inputB[7])) | ((s1 & ~s2 & ~s3) & ~(inputA[7] & inputB[7])) | ((s1 & ~s2 & s3) & ~(inputA[7] | inputB[7])) | ((s1 & s2 & ~s3) & ~(inputA[7])) | ((s1 & s2 & s3) & temp[7]));
assign out[8] = (((~s1 & ~s2 & ~s3) & inputA[8] & inputB[8]) | ((~s1 & ~s2 & s3) & (inputA[8] | inputB[8])) | ((~s1 & s2 & ~s3) & (inputA[8] ^ inputB[8])) | ((~s1 & s2 & s3) & ~(inputA[8] ^ inputB[8])) | ((s1 & ~s2 & ~s3) & ~(inputA[8] & inputB[8])) | ((s1 & ~s2 & s3) & ~(inputA[8] | inputB[8])) | ((s1 & s2 & ~s3) & ~(inputA[8])) | ((s1 & s2 & s3) & temp[8]));
assign out[9] = (((~s1 & ~s2 & ~s3) & inputA[9] & inputB[9]) | ((~s1 & ~s2 & s3) & (inputA[9] | inputB[9])) | ((~s1 & s2 & ~s3) & (inputA[9] ^ inputB[9])) | ((~s1 & s2 & s3) & ~(inputA[9] ^ inputB[9])) | ((s1 & ~s2 & ~s3) & ~(inputA[9] & inputB[9])) | ((s1 & ~s2 & s3) & ~(inputA[9] | inputB[9])) | ((s1 & s2 & ~s3) & ~(inputA[9])) | ((s1 & s2 & s3) & temp[9]));
assign out[10] = (((~s1 & ~s2 & ~s3) & inputA[10] & inputB[10]) | ((~s1 & ~s2 & s3) & (inputA[10] | inputB[10])) | ((~s1 & s2 & ~s3) & (inputA[10] ^ inputB[10])) | ((~s1 & s2 & s3) & ~(inputA[10] ^ inputB[10])) | ((s1 & ~s2 & ~s3) & ~(inputA[10] & inputB[10])) | ((s1 & ~s2 & s3) & ~(inputA[10] | inputB[10])) | ((s1 & s2 & ~s3) & ~(inputA[10])) | ((s1 & s2 & s3) & temp[10]));
assign out[11] = (((~s1 & ~s2 & ~s3) & inputA[11] & inputB[11]) | ((~s1 & ~s2 & s3) & (inputA[11] | inputB[11])) | ((~s1 & s2 & ~s3) & (inputA[11] ^ inputB[11])) | ((~s1 & s2 & s3) & ~(inputA[11] ^ inputB[11])) | ((s1 & ~s2 & ~s3) & ~(inputA[11] & inputB[11])) | ((s1 & ~s2 & s3) & ~(inputA[11] | inputB[11])) | ((s1 & s2 & ~s3) & ~(inputA[11])) | ((s1 & s2 & s3) & temp[11]));
assign out[12] = (((~s1 & ~s2 & ~s3) & inputA[12] & inputB[12]) | ((~s1 & ~s2 & s3) & (inputA[12] | inputB[12])) | ((~s1 & s2 & ~s3) & (inputA[12] ^ inputB[12])) | ((~s1 & s2 & s3) & ~(inputA[12] ^ inputB[12])) | ((s1 & ~s2 & ~s3) & ~(inputA[12] & inputB[12])) | ((s1 & ~s2 & s3) & ~(inputA[12] | inputB[12])) | ((s1 & s2 & ~s3) & ~(inputA[12])) | ((s1 & s2 & s3) & temp[12]));
assign out[13] = (((~s1 & ~s2 & ~s3) & inputA[13] & inputB[13]) | ((~s1 & ~s2 & s3) & (inputA[13] | inputB[13])) | ((~s1 & s2 & ~s3) & (inputA[13] ^ inputB[13])) | ((~s1 & s2 & s3) & ~(inputA[13] ^ inputB[13])) | ((s1 & ~s2 & ~s3) & ~(inputA[13] & inputB[13])) | ((s1 & ~s2 & s3) & ~(inputA[13] | inputB[13])) | ((s1 & s2 & ~s3) & ~(inputA[13])) | ((s1 & s2 & s3) & temp[13]));
assign out[14] = (((~s1 & ~s2 & ~s3) & inputA[14] & inputB[14]) | ((~s1 & ~s2 & s3) & (inputA[14] | inputB[14])) | ((~s1 & s2 & ~s3) & (inputA[14] ^ inputB[14])) | ((~s1 & s2 & s3) & ~(inputA[14] ^ inputB[14])) | ((s1 & ~s2 & ~s3) & ~(inputA[14] & inputB[14])) | ((s1 & ~s2 & s3) & ~(inputA[14] | inputB[14])) | ((s1 & s2 & ~s3) & ~(inputA[14])) | ((s1 & s2 & s3) & temp[14]));
assign out[15] = (((~s1 & ~s2 & ~s3) & inputA[15] & inputB[15]) | ((~s1 & ~s2 & s3) & (inputA[15] | inputB[15])) | ((~s1 & s2 & ~s3) & (inputA[15] ^ inputB[15])) | ((~s1 & s2 & s3) & ~(inputA[15] ^ inputB[15])) | ((s1 & ~s2 & ~s3) & ~(inputA[15] & inputB[15])) | ((s1 & ~s2 & s3) & ~(inputA[15] | inputB[15])) | ((s1 & s2 & ~s3) & ~(inputA[15])) | ((s1 & s2 & s3) & temp[15]));



endmodule