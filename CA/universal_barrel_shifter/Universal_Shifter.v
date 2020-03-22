`include "barrel_shifter_left_5.v"
`include "barrel_shifter_right_5.v"

module universal_shifter(inputA, right, shift_by, out);

input [15 : 0] inputA;
input [4 : 0] shift_by;
input right;
input [15 : 0] out;

wire [15 : 0] right_shifted_number, left_shifted_number;

barrel_shifter_l l(shift_by, inputA, left_shifted_number);
barrel_shifter_r r(shift_by, inputA, right_shifted_number);

assign inputA = 16'b1111111111111111;
assign shift_by = 'd15;
assign right = 1'b0;

always@(*)
begin
  $display("input = %b, shift_by = %b, out = %b, right_shift_num = %b, left_shift_num = %b", inputA, shift_by, out, right_shifted_number, left_shifted_number);
end


mux2x1 s1(left_shifted_number[0], right_shifted_number[0], out[0], right);
mux2x1 s2(left_shifted_number[1], right_shifted_number[1], out[1], right);
mux2x1 s3(left_shifted_number[2], right_shifted_number[2], out[2], right);
mux2x1 s4(left_shifted_number[3], right_shifted_number[3], out[3], right);
mux2x1 s5(left_shifted_number[4], right_shifted_number[4], out[4], right);
mux2x1 s6(left_shifted_number[5], right_shifted_number[5], out[5], right);
mux2x1 s7(left_shifted_number[6], right_shifted_number[6], out[6], right);
mux2x1 s8(left_shifted_number[7], right_shifted_number[7], out[7], right);
mux2x1 s9(left_shifted_number[8], right_shifted_number[8], out[8], right);
mux2x1 s10(left_shifted_number[9], right_shifted_number[9], out[9], right);
mux2x1 s11(left_shifted_number[10], right_shifted_number[10], out[10], right);
mux2x1 s12(left_shifted_number[11], right_shifted_number[11], out[11], right);
mux2x1 s13(left_shifted_number[12], right_shifted_number[12], out[12], right);
mux2x1 s14(left_shifted_number[13], right_shifted_number[13], out[13], right);
mux2x1 s15(left_shifted_number[14], right_shifted_number[14], out[14], right);
mux2x1 s16(left_shifted_number[15], right_shifted_number[15], out[15], right);


endmodule