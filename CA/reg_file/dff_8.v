module dff(d,clk,reset,q);
input [7 : 0]d;
input clk, reset;
output reg [7 : 0]q;

always@(posedge clk or posedge reset)
	if(reset)
 		q <= 7'b0;
	else
		q <= d;

endmodule