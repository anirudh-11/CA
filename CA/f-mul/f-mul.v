`include "WallaceMultiplier32.v"

`include "barrel_shifter_right_5.v"

`include "RCA6bit.v"

`include "RCA5bit.v"

module f_mul(Asign, Bsign, Amantissa, Bmantissa, Aexp, Bexp, product);

input Asign, Bsign;
input [9 : 0] Amantissa, Bmantissa;
input [4 : 0] Aexp, Bexp;
output product;

wire zero_of_a, zero_of_b, inf_of_a, inf_of_b;

assign zero_of_a = (| Amantissa) | (| Aexp);
assign zero_of_b = (| Bmantissa) | (| Bexp);
assign inf_of_a = (~(| Amantissa)) & (& Aexp);
assign inf_of_b = (~(| Bmantissa)) & (& Bexp);

assign Aexp = 5'b00000;
assign Bexp = 5'b00000;
assign Asign = 1'b1;
assign Bsign = 1'b0;
assign Amantissa = 10'b0101010101;
assign Bmantissa = 10'b0101010101;

always@(*)
begin
  $display("Asign = %b, Aexp = %b, Amantissa = %b, Bsign = %b, Bexp = %b, Bmantissa = %b, psign = %b, pexp = %b, pmantissa = %b, u_flow = %b, o_flow = %b", Asign, Aexp, Amantissa, Bsign, Bexp, Bmantissa, p_sign, p_exp, p_mantissa, u_flow, o_flow);
end



wire p_sign;
assign p_sign = ~(Asign ^ Bsign);
wire [15 : 0]wallaceA, wallaceB; 
wire [31 : 0]wallace_product;

assign wallaceA = {{{5'b00000}, zero_of_a}, Amantissa};
assign wallaceB = {{{5'b00000}, zero_of_b}, Bmantissa};

Wallacemultiplier32 wm1(wallaceA, wallaceB, wallace_product);

wire [10 : 0]temp_matissa_1;
assign temp_matissa_1 = wallace_product[20 : 10];
wire [10 : 0]temp_mantissa_2;
wire [9 : 0]p_mantissa;

barrel_shifter_r rs1({{4'b0000}, wallace_product[21]}, temp_matissa_1, temp_mantissa_2);


assign p_mantissa[0] = temp_mantissa_2[0] &~(inf_of_a | inf_of_b); 
assign p_mantissa[1] = temp_mantissa_2[1] &~(inf_of_a | inf_of_b); 
assign p_mantissa[2] = temp_mantissa_2[2] &~(inf_of_a | inf_of_b); 
assign p_mantissa[3] = temp_mantissa_2[3] &~(inf_of_a | inf_of_b); 
assign p_mantissa[4] = temp_mantissa_2[4] &~(inf_of_a | inf_of_b); 
assign p_mantissa[5] = temp_mantissa_2[5] &~(inf_of_a | inf_of_b); 
assign p_mantissa[6] = temp_mantissa_2[6] &~(inf_of_a | inf_of_b); 
assign p_mantissa[7] = temp_mantissa_2[7] &~(inf_of_a | inf_of_b); 
assign p_mantissa[8] = temp_mantissa_2[8] &~(inf_of_a | inf_of_b); 
assign p_mantissa[9] = temp_mantissa_2[9] &~(inf_of_a | inf_of_b); 




wire [5 : 0]temp_exp_1;
wire [6 : 0]temp_exp_2;
wire [6 : 0]temp_exp_3;
RCA5bit exp_add1(Aexp, Bexp, temp_exp_1);
RCA6bit exp_add2(temp_exp_1, 6'b110001, temp_exp_2);
RCA6bit exp_add3({{5'b0000}, wallace_product[21]}, temp_exp_2[5 : 0], temp_exp_3);

wire [4 : 0]p_exp;
assign p_exp = temp_exp_3[4 : 0];

wire o_flow, u_flow;

assign o_flow = ((temp_exp_1[5]&temp_exp_1[4]) | (temp_exp_1[3]&temp_exp_1[2]&temp_exp_1[1])) & (zero_of_a & zero_of_b);
assign u_flow = (~temp_exp_1[5]&~temp_exp_1[4])&(zero_of_a & zero_of_b);

endmodule