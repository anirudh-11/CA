`include "mux2x1.v"

module mux_1x8(inp1, inp2, out, select, clk);

input [7 : 0] inp1, inp2;
input select, clk;
output reg[7 : 0]out;

// mux2x1 m1(inp1[0], inp2[0], out[0], select);
// mux2x1 m2(inp1[1], inp2[1], out[1], select);
// mux2x1 m3(inp1[2], inp2[2], out[2], select);
// mux2x1 m4(inp1[3], inp2[3], out[3], select);
// mux2x1 m5(inp1[4], inp2[4], out[4], select);
// mux2x1 m6(inp1[5], inp2[5], out[5], select);
// mux2x1 m7(inp1[6], inp2[6], out[6], select);
// mux2x1 m8(inp1[7], inp2[7], out[7], select);

always@(posedge clk)
begin
    out[0] <= (select & inp2[0]) | (~(select) & inp1[0]);
    out[1] <= (select & inp2[1]) | (~(select) & inp1[1]);
    out[2] <= (select & inp2[2]) | (~(select) & inp1[2]);
    out[3] <= (select & inp2[3]) | (~(select) & inp1[3]);
    out[4] <= (select & inp2[4]) | (~(select) & inp1[4]);
    out[5] <= (select & inp2[5]) | (~(select) & inp1[5]);
    out[6] <= (select & inp2[6]) | (~(select) & inp1[6]);
    out[7] <= (select & inp2[7]) | (~(select) & inp1[7]);
end

endmodule