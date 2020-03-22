`include "sixteen_bit_adder.v"
module thirtytwo_bit_adder (a,b,cin,sum,cout);


input [31:0] a, b;
input cin;
output [31:0] sum;
output cout;
wire ca;


    sixteen_bit_adder FA_0(a[15:0],b[15:0],cin,sum[15:0],ca);
    sixteen_bit_adder FA_1(a[31:16],b[31:16],ca,sum[31:16],cout);



endmodule