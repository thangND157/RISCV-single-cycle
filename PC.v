module PC(pc_in, clk, pc_out);
input [31:0] pc_in;
input clk;
output [31:0] pc_out;

reg [31:0] pc_out;

always @(posedge clk)
	pc_out <= pc_in;

initial
	pc_out = 32'd0;

endmodule