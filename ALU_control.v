
//////////----------ALU CONTROL-------------///////////

module ALU_control (
        input fun7,
        input [2:0]fun3,
        input [1:0]ALUop,
        output reg [3:0]control_out);
always @(*)begin
    case({ALUop,fun7,fun3})
    6'b00_0_000 : control_out <= 4'b0010;
    6'b01_0_000 : control_out <= 4'b0110;
    6'b10_0_000 : control_out <= 4'b0010;
    6'b10_1_000 : control_out <= 4'b0110;
    6'b10_1_111 : control_out <= 4'b0000;
    6'b10_1_110 : control_out <= 4'b0001;
    default control_out <= 4'bxxxx;
    endcase

end
endmodule


