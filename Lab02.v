module Lab02 (clk, reset,i, F, stateOut);

input clk;	// clock signal
input reset;	// reset input
input i;	// binary input
output reg [2:0] stateOut;
output reg F; // output of the sequence detector


parameter S0 = 3'b000 // "S0" State
, S1 = 3'b001  // "S1" State
, S2 = 3'b011	// "S2" State
, S3 = 3'b010	// "OnceS0S1" State
, S4 = 3'b110;	// "S4" State


reg [2:0] state, nState;

always @(posedge clk, posedge reset)
begin
	if(reset == 1)
	state <= S0;
	else
	state <= nState;
end

always @(state,i) 
begin
	case(state)
	S0:begin
		if(i == 1)
		nState = S1;
		else
		nState = S0;
	end
	
	S1:begin
		if(i == 0)
		nState = S2;
		else
		nState = S1;
	end
	
	S2:begin
		if(i == 0)
		nState = S3;
		else
		nState = S2;
	end
	
	S3:begin
		if(i==0)
		nState = S4;
		else
		nState = S3;
	end
	
	S4:begin
		if (i == 1)
		nState = S2;
		else
		nState = S1;
	end
default: nState = S0;
endcase
end

always @(state)
begin
	case(state)
	S0: 	F = 0;
	S0: stateOut = 3'b000;
	S1:  F = 0;
	S1: stateOut = 3'b001;
	S2: F=0;
	S2: stateOut = 3'b010;
	S3: F=0;
	S3: stateOut = 3'b011;
	S4: F = 1;
	S4: stateOut = 3'b100;
	
	default: F = 0;
	endcase
end
endmodule 