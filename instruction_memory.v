////////////INSTRUCTION MEMORY////////////////
module instruction_mem(
    input clk,rst,
    input [31:0]read_addr,
    output [31:0] inst_out);
reg [31:0] I_mem[63:0];

//assign inst_out <= I_mem[read_addr];

    integer k;
always @(posedge clk) begin
if(rst)begin
            for(k=0; k<64; k=k+1)begin
                I_mem[k] <= 32'b0000;
                end
    end
else
    //R TYPE Instruction
    I_mem[0]= 32'b0000_0000_0000_0000_0000_0000_0000_0000;     //no Operation
    I_mem[4]= 32'b0000000_11001_10000_000_01101_0110011;     //add x13,x16,x25
    I_mem[8]= 32'b0100000_00011_01000_000_00101_0110011;    //sub x5,x8,x3
    I_mem[12]= 32'b0000000_00011_00010_111_00001_0110011;    //and x1,x2,x3
    I_mem[16]= 32'b0000000_00101_00011_110_00100_0110011;    //or x4,x3,x5
    
//// I TYPE    
    I_mem[20]= 32'b000000000011_10101_000_10110_0010011;      //addi x22,x21,3
    I_mem[24]= 32'b000000000001_01000_110_01001_0010011;      //ori x9,x8,1
    /// L TYPE    
    I_mem[28]= 32'b000000001111_00101_010_01000_0010011;      // lw x8,15(x5)
    I_mem[32]= 32'b000000000011_00011_010_01001_0010011;      // lw x9,3(x3)
    
   ///// S TYPE    
    I_mem[36]= 32'b0000000_01111_00101_010_01100_0100011;    //sw x15,12(x5)
    I_mem[40]= 32'b0000000_01110_00110_010_01010_0100011;    //sw x14,10(x6)
   /// SB TYPE    
    I_mem[44]= 32'h00948663;  //beq x9,x9,12

end
assign inst_out = I_mem[read_addr];

endmodule


