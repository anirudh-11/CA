//`include "Full_adder.v"
module four_bit_adder (a,b,cin,sum,cout);


input [3:0] a, b;
input cin;
output [3:0] sum;
output cout;
wire [3:0] ca;


    Full_adder FA_0(a[0],b[0],cin,sum[0],ca[0]);
    Full_adder FA_1(a[1],b[1],ca[0],sum[1],ca[1]);
    Full_adder FA_2(a[2],b[2],ca[1],sum[2],ca[2]);
    Full_adder FA_3(a[3],b[3],ca[2],sum[3],cout);

//$monitor("a = %b, b = %b, Sum = %b, ca = %b",a,b,sum,ca);

endmodule