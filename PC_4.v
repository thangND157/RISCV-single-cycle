module PC_4(pc_in, pc_out);
input [31:0] pc_in;
output [31:0] pc_out;

reg [31:0] pc_out;

always @(*)
	pc_out <= pc_in + 4;

initial
	pc_out <= 32'd0;

endmodule