module decoder_3_to_8(select, decoded_value, enable);

input [2 : 0]select;
input enable;
output [7 : 0]decoded_value;

assign decoded_value[0] = (~ select[2]) & (~ select[1]) & (~ select[0]) & enable;
assign decoded_value[1] = (~ select[2]) & (~ select[1]) & (select[0]) & enable;
assign decoded_value[2] = (~ select[2]) & ( select[1]) & (~ select[0]) & enable;
assign decoded_value[3] = (~ select[2]) & ( select[1]) & ( select[0]) & enable;
assign decoded_value[4] = ( select[2]) & (~ select[1]) & (~select[0]) & enable;
assign decoded_value[5] = ( select[2]) & (~ select[1]) & ( select[0]) & enable;
assign decoded_value[6] = ( select[2]) & ( select[1]) & (~ select[0]) & enable;
assign decoded_value[7] = ( select[2]) & ( select[1]) & ( select[0]) & enable;

endmodule