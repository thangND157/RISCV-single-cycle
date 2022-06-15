module DMEM(addr, dataW, memRW, clk, dataR);
input [11:0]addr;
input [31:0] dataW;
input [3:0] memRW;
input clk;
output [31:0] dataR;

reg [31:0] dataR;
reg [7:0] mem[0:4095];

always @(*) begin
	if(memRW[3] == 0)
		case(memRW[2:0])
		3'b001: dataR <= {{24{mem[addr] [7]}}, mem[addr]};
		3'b010: dataR <= {{16{mem[addr+1] [7]}}, mem[addr+1], mem[addr]};
		3'b011: dataR <= {mem[addr+3], mem[addr+2], mem[addr+1], mem[addr]};
		3'b100: dataR <= {24'd0, mem[addr]};
		3'b110: dataR <= {16'd0, mem[addr+1], mem[addr]};
		endcase
end
always @(negedge clk) begin
    if(memRW[3] == 1) begin
		mem[addr] <= dataW[7:0];
        mem[addr+1] <= memRW[1] ? dataW[15:8] : mem[addr+1];
        mem[addr+2] <= memRW[2] ? dataW[23:16] : mem[addr+2];
        mem[addr+3] <= memRW[2] ? dataW[31:24] : mem[addr+3];
	end
end

initial begin
	mem[0] = 0;
	mem[1] = 0;
	mem[2] = 0;
	mem[3] = 0;
end

endmodule
