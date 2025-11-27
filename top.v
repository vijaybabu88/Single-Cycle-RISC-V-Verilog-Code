`include "program_counter.v"
`include "instruction_memory.v"
`include "register_file.v"
`include "immediate_generator.v"
`include "control_unit.v"
`include "ALU_control.v"
`include "ALU.v"
`include "data_memory.v"
`include "mux.v"
`include "AND_Adder.v"

///////////-------------------- TOP ----------------/////////////////
module top(clk,rst);

input clk,rst;

wire [31:0]pc_top, instruction_top, rd1_top, rd2_top, imm_top, mux1_top, sum_top, nxtPC_top, pc_in_top, ALU_top, memData_top, writeBack_top;
wire regWrite_top, ALUsrc_top,zero_top, branch_top, and_top, memtoReg_top, memWrite_top, memRead_top;
wire [1:0]ALUop_top;
wire [3:0] ALUctrl_top;
// PC
program_counter PC( .clk(clk),.rst(rst),.pc_in(pc_in_top),.pc_out(pc_top));

//PC+4
pcplus4 PC4(.fromPC(pc_top),.nextoPC(nxtPC_top));

//instruction memory
instruction_mem Imem(.clk(clk),.rst(rst),.read_addr(pc_top),.inst_out(instruction_top));

//register file
reg_file reg_file(.clk(clk),.rst(rst),.regwrite(regWrite_top),.rs1(instruction_top[19:15]),.rs2(instruction_top[24:20]),.rd(instruction_top[11:7]),.write_data(writeBack_top),.read_data1(rd1_top),.read_data2(rd2_top));

//Immediate Generator
immgen imm_gen(.opcode(instruction_top[6:0]),.instruction(instruction_top),.imm_out(imm_top));

//Control Unit
control_unit CU(.instruction(instruction_top[6:0]),.branch(branch_top),.memRead(memRead_top),.memtoReg(memtoReg_top), .memWrite(memWrite_top), .ALUsrc(ALUsrc_top), .regWrite(regWrite_top),.ALUop(ALUop_top));

//ALU
ALU_unit ALU(.A(rd1_top),.B(mux1_top),.control_in(ALUctrl_top),.result(ALU_top),.zero(zero_top)); 

//ALU_Control
ALU_control AC(.fun7(instruction_top[30]),.fun3(instruction_top[14:12]),.ALUop(ALUop_top),.control_out(ALUctrl_top));

//Data_Memory
data_memory RAM(.clk(clk),.rst(rst),.memWrite(memWrite_top),.memRead(memRead_top),.read_addr(ALU_top),.write_data(rd2_top),.memData_out(memData_top));

//Multiplexers
mux1 M1(.sel1(ALUsrc_top),.A1(rd2_top),.B1(imm_top),.mux1_out(mux1_top));

mux2 M2(.sel2(and_top),.A2(nxtPC_top),.B2(sum_top),.mux2_out(pc_in_top));

mux3 M3(.sel3(memtoReg_top),.A3(ALU_top),.B3(memData_top),.mux3_out(writeBack_top));

//AND Logic
and_logic AND(.branch(branch_top),.zero(zero_top),.and_out(and_top));

//adder
adder ADD1(.in_1(pc_top),.in_2(imm_top),.sum(sum_top));

endmodule
