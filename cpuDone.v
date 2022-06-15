module cpuDone();

reg clk;
wire [31:0] pc_in, pc_out, pc4_out;
wire [31:0] rs1_out, rs2_out, wb_out;
wire [31:0] imm_out;
wire br_eq, br_lt;
wire [31:0] alumux1_out, alumux2_out, aluout;
wire [31:0] dmem_out;

wire [31:0] inst;
wire [4:0] rs1, rs2, rd;
wire [24:0] imm_in;

wire [17:0] control;
wire pcmux_sel;
wire [2:0] imm_sel;
wire regfilemux_sel;
wire cmpop;
wire alumux1_sel;
wire alumux2_sel;
wire [3:0] aluop;
wire [3:0] dmem_sel;
wire [1:0] wbmux_sel;

assign rs1 = inst[19:15];
assign rs2 = inst[24:20];
assign rd = inst[11:7];
assign imm_in = inst[31:7];

assign pcmux_sel = control[17];
assign imm_sel = control[16:14];
assign regfilemux_sel = control[13];
assign cmpop = control[12];
assign alumux1_sel = control[11];
assign alumux2_sel = control[10];
assign aluop = control[9:6];
assign dmem_sel = control[5:2];
assign wbmux_sel = control[1:0];

PC PC0(pc_in, clk, pc_out);
PC_4 PC40(pc_out, pc4_out);
IMEM IMEM0(pc_out, inst);

Reg Reg0(rs1, rs2, rd, wb_out, regfilemux_sel, clk, rs1_out, rs2_out);
ImmGen Imm0(imm_in, imm_sel, imm_out);

BranchComp Branch0(rs1_out, rs2_out, cmpop, br_eq, br_lt);

mux2 aluMux1(rs2_out, imm_out, alumux1_out, alumux1_sel);
mux2 aluMux2(rs1_out, pc_out, alumux2_out, alumux2_sel);

ALU ALU0(alumux2_out, alumux1_out, aluop, aluout);

DMEM DMEM0(aluout[11:0], rs2_out, dmem_sel, clk, dmem_out);
mux3 wbMux(dmem_out, aluout, pc4_out, wb_out, wbmux_sel);

mux2 pcMux(pc4_out, aluout, pc_in, pcmux_sel);

Control Control0(inst, br_eq, br_lt, control);

always begin
	#0 clk = 1'b0;
	#100 clk = 1;
	#100;
end

endmodule
