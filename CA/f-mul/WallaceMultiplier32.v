`include "WallaceMultiplier.v"
`include "thirtytwo_bit_adder.v"
`include "Full_adder.v"

module Wallacemultiplier32(a, b, product);

input [15 : 0]a, b;
output [31 : 0]product;
// reg [31 : 0] proc;
// assign a = 16'b1110101011010;
// assign b = 16'b1110101010101;
wire [17 : 0]pa1, pa2, pa3, pa4;

wire [7 : 0]ha, hb, la, lb;

wire [31 : 0]pp1, pp2, pp3, pp4;

wire [31 : 0]intersum1, intersum2;

wire cin;
wire cout;
assign cin = 1'b0;

assign ha = a[15 : 8];
assign hb = b[15 : 8];
assign la = a[7 : 0];
assign lb = b[7 : 0];




WallaceMultiplier wm1 (la, lb, pa1);
WallaceMultiplier wm2 (ha, lb, pa2);
WallaceMultiplier wm3 (la, hb, pa3);
WallaceMultiplier wm4 (ha, hb, pa4);

assign pp1[15 : 0] = pa1[15 : 0];
assign pp2[23 : 8] = pa2[15 : 0];
assign pp3[23 : 8] = pa3[15 : 0];
assign pp4[31 : 16] = pa4[15 : 0];

assign pp1[16] = 1'b0;
assign pp1[17] = 1'b0;
assign pp1[18] = 1'b0;
assign pp1[19] = 1'b0;
assign pp1[20] = 1'b0;
assign pp1[21] = 1'b0;
assign pp1[22] = 1'b0;
assign pp1[23] = 1'b0;
assign pp1[24] = 1'b0;
assign pp1[25] = 1'b0;
assign pp1[26] = 1'b0;
assign pp1[27] = 1'b0;
assign pp1[28] = 1'b0;
assign pp1[29] = 1'b0;
assign pp1[30] = 1'b0;
assign pp1[31] = 1'b0;

assign pp2[0] = 1'b0;
assign pp2[1] = 1'b0;
assign pp2[2] = 1'b0;
assign pp2[3] = 1'b0;
assign pp2[4] = 1'b0;
assign pp2[5] = 1'b0;
assign pp2[6] = 1'b0;
assign pp2[7] = 1'b0;
assign pp2[24] = 1'b0;
assign pp2[25] = 1'b0;
assign pp2[26] = 1'b0;
assign pp2[27] = 1'b0;
assign pp2[28] = 1'b0;
assign pp2[29] = 1'b0;
assign pp2[30] = 1'b0;
assign pp2[31] = 1'b0;

assign pp3[0] = 1'b0;
assign pp3[1] = 1'b0;
assign pp3[2] = 1'b0;
assign pp3[3] = 1'b0;
assign pp3[4] = 1'b0;
assign pp3[5] = 1'b0;
assign pp3[6] = 1'b0;
assign pp3[7] = 1'b0;
assign pp3[24] = 1'b0;
assign pp3[25] = 1'b0;
assign pp3[26] = 1'b0;
assign pp3[27] = 1'b0;
assign pp3[28] = 1'b0;
assign pp3[29] = 1'b0;
assign pp3[30] = 1'b0;
assign pp3[31] = 1'b0;

assign pp4[0] = 1'b0;
assign pp4[1] = 1'b0;
assign pp4[2] = 1'b0;
assign pp4[3] = 1'b0;
assign pp4[4] = 1'b0;
assign pp4[5] = 1'b0;
assign pp4[6] = 1'b0;
assign pp4[7] = 1'b0;
assign pp4[8] = 1'b0;
assign pp4[9] = 1'b0;
assign pp4[10] = 1'b0;
assign pp4[11] = 1'b0;
assign pp4[12] = 1'b0;
assign pp4[13] = 1'b0;
assign pp4[14] = 1'b0;
assign pp4[15] = 1'b0;


thirtytwo_bit_adder ta1(pp1, pp2, cin, intersum1, cout);
thirtytwo_bit_adder ta2(intersum1, pp3, cin, intersum2, cout);
thirtytwo_bit_adder ta3(intersum2, pp4, cin, product, cout);


// always@(*) begin
// $display("a = %d b = %d pa1 = %b ,pp1 = %b, pp2 = %b, pp3 = %b, pp4 = %b, intersum1 = %b, intersum2 = %b, product = %d",a, b, pa1, pa2, pa3, pa4, pp1, pp2, pp3, pp4, intersum1, intersum2, product);
// end



endmodule