`include "decoder_3_to_8.v"

module decoder_5_to_32(select, decoded_value);

input [4 : 0]select;
output [31 : 0]decoded_value;

wire [7 : 0]temp;
wire [2 : 0]enable_select;

// assign select = 5'd13;

// always@(*)
// begin
//     $display("select = %d, temp = %b, decoded_value = %b\n", select, temp, decoded_value);
// end



assign enable_select[2] = 1'b0;
assign enable_select[0] = select[3];
assign enable_select[1] = select[4];



decoder_3_to_8 d1(enable_select, temp, 1'b1);
decoder_3_to_8 d2(select[2 : 0], decoded_value[7 : 0], temp[0]);
decoder_3_to_8 d3(select[2 : 0], decoded_value[15 : 8], temp[1]);
decoder_3_to_8 d4(select[2 : 0], decoded_value[23 : 16], temp[2]);
decoder_3_to_8 d5(select[2 : 0], decoded_value[31 : 24], temp[3]);





endmodule