`include "four_bit_adder.v"
module eight_bit_adder (a,b,cin,sum,cout);


input [7:0] a, b;
input cin;
output [7:0] sum;
output cout;
wire ca;


    four_bit_adder FA_0(a[3:0],b[3:0],cin,sum[3:0],ca);
    four_bit_adder FA_1(a[7:4],b[7:4],ca,sum[7:4],cout);



endmodule