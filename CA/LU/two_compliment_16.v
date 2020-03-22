`include "RecursiveDoubling.v"

module bit2comp16(inp,out);

input [15 : 0] inp;
output [15:0] out;

wire [15:0] temp;
// assign inp = 5'b11100;
// assign out = ~inp;

// always @(*) begin
// $display("%b",out);
// end

//assign temp = ~inp;
assign temp = ~inp;
wire [16:0] RDout;

RecursiveDoubling rd1 (temp, 16'b0000000000000001, 1'b0, RDout[15:0], RDout[16]);
//RCA11bit ra1 (temp,5'b00001,temp1);	//out[5] is Carry Bit if 1 means positive

assign out = RDout[15:0];

endmodule 