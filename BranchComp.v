module BranchComp(dataA, dataB, BrUn, BrEq, BrLT);
input [31:0] dataA, dataB;
input BrUn;
output BrEq, BrLT;

assign BrEq = (dataA == dataB);
assign BrLT = (BrUn) ? ($signed(dataA) < $signed(dataB)) : (dataA < dataB);

endmodule
