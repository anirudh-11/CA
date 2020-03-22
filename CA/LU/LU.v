`include "mux_8x1.v"

module LU(inpA, inpB, logical_out, selection);

input [15 : 0] inpA, inpB;
input [2 : 0] selection;
output [15 : 0] logical_out;

mux_8 m1(inpA, inpB, selection[2], selection[1], selection[0], logical_out);

endmodule