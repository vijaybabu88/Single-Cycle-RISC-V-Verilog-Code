
/////////////CONTROL UNIT/////////////

module control_unit (
    input [6:0]instruction,
    output reg branch,memRead,memtoReg, memWrite, ALUsrc, regWrite,
    output reg [1:0]ALUop);

always @(*)begin
        case (instruction)
        7'b011_0011 : {ALUsrc,memtoReg,regWrite,memRead,memWrite,branch,ALUop} <= 8'b001000_01; //////R type Instruction
        7'b000_0011 : {ALUsrc,memtoReg,regWrite,memRead,memWrite,branch,ALUop} <= 8'b111100_00; //////Load type Instruction
        7'b010_0011 : {ALUsrc,memtoReg,regWrite,memRead,memWrite,branch,ALUop} <= 8'b100010_00; //////Store type Instruction
        7'b110_0011 : {ALUsrc,memtoReg,regWrite,memRead,memWrite,branch,ALUop} <= 8'b000001_01; //////Branch type Instruction
        
        endcase
end
endmodule


