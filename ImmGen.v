module ImmGen(imm_in, sel, imm_out);
input [24:0] imm_in;
input [2:0] sel;
output [31:0] imm_out;

reg [31:0] imm_out;

always @(*) begin
	case(sel)
	3'b000: imm_out <= {{20{imm_in[24]}}, imm_in[24:13]};
	3'b001: imm_out <= {20'd0, imm_in[24:13]};
	3'b010: imm_out <= {{20{imm_in[24]}}, imm_in[24:18], imm_in[4:0]};
	3'b011: imm_out <= {{19{imm_in[24]}}, imm_in[24], imm_in[0], imm_in[23:18], imm_in[4:1], 1'b0};
	3'b100: imm_out <= {imm_in[24:5], 12'd0};
	3'b101: imm_out <= {27'd0, imm_in[17:13]};
	3'b110: imm_out <= {{11{imm_in[24]}}, imm_in[24], imm_in[12:5], imm_in[13], imm_in[23:14], 1'b0};
	endcase
end
endmodule
