// `include "Full_adder.v"

module RCA6bit(inpA,inpB,out);
input [5:0] inpA,inpB;
output [6:0] out;

wire w0,w1,w2,w3,w4;

Full_adder fa0 (inpA[0],inpB[0],1'b0,out[0],w0);
Full_adder fa1 (inpA[1],inpB[1],w0,out[1],w1);
Full_adder fa2 (inpA[2],inpB[2],w1,out[2],w2);
Full_adder fa3 (inpA[3],inpB[3],w2,out[3],w3);
Full_adder fa4 (inpA[4],inpB[4],w3,out[4],w4);
Full_adder fa5 (inpA[5],inpB[5],w4,out[5],out[6]);

endmodule 