module ALU(a, b, sel, out);
input [31:0] a;
input [31:0] b;
input [3:0] sel;
output [31:0] out;

reg [31:0] out;

always @(*) begin
	case(sel)
	4'b0000: out <= a + b;
	4'b0001: out <= a - b;
	4'b0010: out <= a << b;
	4'b0011: out <= ($signed(a) < $signed(b)) ? 32'd1 : 32'd0;
	4'b0100: out <= (a < b) ? 32'd1 : 32'd0;
	4'b0101: out <= a ^ b;
	4'b0110: out <= a >> b;
	4'b0111: out <= a >>> b;
	4'b1000: out <= a | b;
	4'b1001: out <= a & b;
	default: out <= b;
	endcase
end

initial
	out <= 32'd0;

endmodule

module t_ALU;
reg [31:0] a;
reg [31:0] b;
reg [3:0] op; 
wire [31:0] out;

ALU test(a,b,op,out);

initial begin
  #0 a = 32'd10; b = 32'd1; op=0;
  #20 a = 32'd4; b = 32'd5; op=7;
  #20 a = -2; b = -1; op=3;
  #20 a = -2; b = -4; op=2;
  #20 a = 32'd0; b = 32'd10; op=6;
  #20 a = 0; b = 0; op=13;
end
endmodule
