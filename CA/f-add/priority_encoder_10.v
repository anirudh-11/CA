`include "priority_encoder_2.v"

`include "priority_encoder_4.v"



module priority_encoder(number, leading_one, validity);

input [9 : 0]number;
output [3 : 0]leading_one;
output validity;

assign number = 10'b1000000100;
always@(*)
begin
    $display("num = %b, validity = %b, leading_one = %b, 2 = %b, 4 = %b, 4 = %b, v1 = %b, v2 = %b, v3 = %b", number, validity, leading_one, partial_leading_one[4], partial_leading_one[3 : 2], partial_leading_one[1 : 0], v1, v2, v3);
end




assign validity = | number;
wire v1, v2, v3;
wire [4 : 0] partial_leading_one;
priority_encoder_2 p1(number[9 : 8], partial_leading_one[4], v1, 1'b1);
priority_encoder_4 p2(number[7 : 4], partial_leading_one[3 : 2], v2, ~v1);
priority_encoder_4 p3(number[3 : 0], partial_leading_one[1 : 0], v3, ~v2 & ~v1);

assign leading_one[3] = validity & v1;
assign leading_one[2] = validity & v2;
assign leading_one[1] = validity & (partial_leading_one[1] | partial_leading_one[3]);
assign leading_one[0] = validity & (partial_leading_one[0] | partial_leading_one[2] | partial_leading_one[4]);













endmodule