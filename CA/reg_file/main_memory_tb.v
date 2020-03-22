`include "main_memory.v"

module top;

reg [4 : 0] read_add_1, read_add_2, write_add;
reg [7 : 0] write_inp;
reg clk, mode;
wire [7 : 0] read_out_1, read_out_2;

memory m1(read_add_1, read_add_2, clk, write_add, read_out_1, read_out_2, write_inp, mode);
initial 
begin
    clk = 0;
    mode = 1;
    read_add_1 = 5'b01011;
    read_add_2 = 5'b01011;
    write_add = 5'b01011;
    forever #5 clk = ~clk;
end

initial
begin
    #10
    mode = 0;
end

initial 
begin
    forever
    begin
        #10
        write_inp = {$random} % 256;
    end
end 

always@(*)
begin
    $monitor("clk = %b, read = %b, write = %b", clk, read_out_2, write_inp);
end

initial

	#100 $finish;


endmodule