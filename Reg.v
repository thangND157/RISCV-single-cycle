module Reg(addrA, addrB, addrD, dataD, regwen, clk, dataA, dataB);
input [4:0] addrA, addrB, addrD;
input [31:0] dataD;
input regwen, clk;
output [31:0] dataA, dataB;

reg [31:0] dataA, dataB;
reg [31:0] register[0:31];

always @(*) begin
	dataA = register[addrA];
	dataB = register[addrB];
end

always @(negedge clk) begin
	if(regwen)
		register[addrD] <= (addrD == 0) ? 0 : dataD;
end

initial begin
	register[0] = 32'd0;
	register[1] = 32'd0;
	register[2] = 32'd0;

	dataA <= 32'd0;
    	dataB <= 32'd0;
end

endmodule
