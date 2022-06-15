module IMEM(addr, out);
input [31:0] addr;
output [31:0] out;

reg [31:0] out;
reg [31:0] mem[0:1023];

wire [9:0] write;
wire [1:0] enable;

assign write = addr[11:2];
assign enable = addr[1:0];

initial
	$readmemh("C:/Users/thang/Downloads/BTL_RISCV/testtest.txt", mem);

always @(*) begin
	if(enable == 2'b00)
		out <= mem[write];
	else
		out <= 32'hz;
end
endmodule
