module mux2(in0, in1, out, sel);
input [31:0] in0, in1;
input sel;
output [31:0] out;

reg [31:0] out;

always @(*) begin
	case(sel)
		1'b0: out <= in0;
		1'b1: out <= in1;
	endcase
end

initial
	out <= 32'd0;

endmodule
