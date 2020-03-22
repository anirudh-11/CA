`include "eight_bit_adder.v"
module sixteen_bit_adder (a,b,cin,sum,cout);


input [15:0] a, b;
input cin;
output [15:0] sum;
output cout;
wire ca;


    eight_bit_adder FA_0(a[7:0],b[7:0],cin,sum[7:0],ca);
    eight_bit_adder FA_1(a[15:8],b[15:8],ca,sum[15:8],cout);



endmodule