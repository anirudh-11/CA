`include "ExponentSub.v"
`include "Mux10x1.v"
`include "barrel_shifter_right_5.v"
`include "barrel_shifter_left_5.v"
`include "priority_encoder_10.v"
`include "11Bit2Comp.v"
`include "mux11x1.v"
`include "RecursiveDoubling.v"

module Floating_Point(Asign,Bsign,Amant,Bmant,Aexp,Bexp,add,out);
	input Asign,Bsign,add;
	input [9:0] Amant,Bmant;
	input [4:0] Aexp,Bexp;
	output out;

assign add = 1'b1;		// if 1 do addition
assign Aexp = 5'b10010;
assign Bexp = 5'b01100;
assign Asign = 1'b0;     // if 1 positive number else negative number
assign Bsign = 1'b1;	// if 1 positive number else negative number
assign Amant = 10'b1000110010; 
assign Bmant = 10'b1010111000;     

always @(*) begin
$display("%b %b %b %b",FinalSign,FinalMant[9:0],FinalExp[4:0],RdOut1);
//$display("%b %b %b %b",Aopnd,Bopnd,diffValAfterRD,diffValAfterRD);
end


// VALUES WHICH ARE FAILING
// 0.53 - 0.21
// -0.53 + 0.21

wire AgrtrB; 	//AgrtrB is 1 if Aexp>Bexp else 0
wire [4:0] ExpDiffVal;
ExponentSub exs1 (Aexp,Bexp,AgrtrB,ExpDiffVal);

wire [9:0] LargeMant,SmallMant;
wire [4:0] LargeExp,SmallExp;
wire [10:0] temp;

wire [9:0] PaddAgrtrB;

wire [15:0] Aopnd,Bopnd;

Mux10x1 ma1 (AgrtrB,PaddAgrtrB);

assign LargeMant = (PaddAgrtrB&Amant) | ((~PaddAgrtrB)&Bmant);		
assign SmallMant = ((~PaddAgrtrB)&Amant) | (PaddAgrtrB&Bmant);
assign LargeExp = (PaddAgrtrB&Aexp) | ((~PaddAgrtrB)&Bexp);

assign temp = {{1'b1} , SmallMant};
assign Aopnd = {{6'b000001} ,LargeMant};

wire [10:0] Bshifted,Bshiftedcomplement;
wire checker;
wire [10:0] BshiftChkr;

assign checker = ~(Asign^add^Bsign);
//BarrelShifter(temp,Bshifted);
barrel_shifter_r bs1 (ExpDiffVal,temp,Bshifted);

bit2comp11 b2 (Bshifted,Bshiftedcomplement);

mux11x1 mx1(Bshifted,Bshiftedcomplement,checker,BshiftChkr);
assign Bopnd = {{5'b00000} ,BshiftChkr};

wire [16:0] RdOut1;
wire cout;
RecursiveDoubling rd1 (Aopnd,Bopnd,1'b0,RdOut1[15:0],RdOut1[16]);

wire [4:0] diffValAfterRD;
wire [10:0] FinalMant1,FinalMant;

wire FinalSign;
assign FinalSign = (AgrtrB&Asign) | ((~AgrtrB)&(~(Bsign^add)));

wire tempo,tempo1;
assign tempo = (~checker)&RdOut1[11];
assign tempo1 = (checker&(~RdOut1[10]));	// Check This

// wire EncodeORNot;
//assign EncodeORNot = tempo1 & tempo;

wire [4:0] leftShiftedVal,left2complement;
wire Val;
wire [5:0] diffValAfterPE;

priority_encoder pe1(RdOut1[9:0], leftShiftedVal[3:0], Val);

assign leftShiftedVal[4] = 1'b0;

bit2comp b2c (leftShiftedVal,left2complement);
RCA5bit rca1 (5'b01010,left2complement,diffValAfterPE);

wire [10:0] leftShiftMantissa;

barrel_shifter_l bsl1 (diffValAfterPE[4:0], RdOut1[10:0], leftShiftMantissa);

assign diffValAfterRD = {{4'b0000} ,tempo};

barrel_shifter_r bs2 (diffValAfterRD,RdOut1[10:0],FinalMant1);

wire [5:0] FinalExp0,FinalExp1,FinalExp;
wire [4:0] expOffset2complement;

RCA5bit raa2 (LargeExp,diffValAfterRD,FinalExp0);

bit2comp b2c1 (diffValAfterPE[4:0],expOffset2complement);
RCA5bit raa3 (FinalExp0[4:0],expOffset2complement,FinalExp1);

assign FinalExp[0] = (FinalExp1[0]&tempo1) | (FinalExp0[0]&(~tempo1));
assign FinalExp[1] = (FinalExp1[1]&tempo1) | (FinalExp0[1]&(~tempo1));
assign FinalExp[2] = (FinalExp1[2]&tempo1) | (FinalExp0[2]&(~tempo1));
assign FinalExp[3] = (FinalExp1[3]&tempo1) | (FinalExp0[3]&(~tempo1));
assign FinalExp[4] = (FinalExp1[4]&tempo1) | (FinalExp0[4]&(~tempo1));

mux11x1 mx2(FinalMant1,leftShiftMantissa,tempo1,FinalMant);

endmodule