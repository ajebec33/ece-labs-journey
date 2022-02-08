module Lab02_Testbench;

reg clk;
reg reset;
reg[3:0] i;
reg [2:0] s;

wire F;
wire [2:0] sOut;

Lab02 dut (.clk(clk), .reset(reset), .i(i), .F(F), .sOut(StateOut));

initial begin
	clk = 1'b0;
	forever #1 clk = ~clk;
end

initial begin
	reset = 1'b1;
	#10
	reset = 1'b0;
end

initial begin
#10 i = 4'b1010;
#10 s = 2'b00;
#10 s = 2'b01;
#10 s = 2'b10;
#10 s = 2'b11;

#10 i = 4'b1001;
#10 s = 2'b00;
#10 s = 2'b01;
#10 s = 2'b10;
#10 s = 2'b11;

#10 i = 4'b1000;
#10 s = 2'b00;
#10 s = 2'b01;
#10 s = 2'b10;
#10 s = 2'b11;
end

endmodule 
