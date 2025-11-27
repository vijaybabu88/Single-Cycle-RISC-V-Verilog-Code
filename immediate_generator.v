/////////////IMMEDIATE GENERATOR/////////////
module immgen(input [6:0]opcode,
              input [31:0]instruction,
              output reg [31:0]imm_out);

always @(*) begin
case(opcode)
        7'b000_0011 : imm_out <= {{20{instruction[31]}},instruction[31:20]}; ////LOAD TYPE
        7'b010_0011 : imm_out <= {{20{instruction[31]}},instruction[31:25],instruction[11:7]};  ////STORE TYPE
        7'b110_0011 : imm_out <= {{19{instruction[31]}},instruction[31],instruction[30:25],instruction[11:8],1'b0};  ////BRANCH TYPE

        default imm_out = 32'b0000;
endcase
end
endmodule


