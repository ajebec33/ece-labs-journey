module Lab02_Testbench;

reg clk;
reg reset;
reg i;


wire F;
wire [2:0] sOut;

Lab02 dut (.clk(clk), .reset(reset), .i(i), .F(F), .sOut(StateOut));

initial begin
	clk = 1'b0;
	forever #10 clk = ~clk;
end

initial begin
	reset = 1'b1;
	#10
	reset = 1'b0;
end

always begin
#10 i = 1'b1;
#10 i = 1'b0;
#10 i = 1'b0;
#10 i = 1'b1;
#10 i = 1'b0;
#10;
end

endmodule 
