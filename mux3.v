module mux3(in0, in1, in2, out, sel);
input [31:0] in0, in1, in2;
input [1:0] sel;
output [31:0] out;

reg [31:0] out;

always @(*) begin
	case(sel)
		2'b00: out <= in0;
		2'b01: out <= in1;
		2'b10: out <= in2;
		2'b11: out <= 32'hz;
	endcase
end

initial
	out <= 32'd0;

endmodule
