//////////Register File////////////
module reg_file(
    input clk,rst,
    input regwrite,
    input [4:0]rs1,rs2,rd,
    input [31:0]write_data,
    output [31:0]read_data1,read_data2);

integer k;

reg [31:0]register[31:0];

initial begin
register[0]=5;
register[1]=0;
register[2]=23;
register[3]=9;
register[4]=32;
register[5]=55;
register[6]=3;
register[7]=16;
register[8]=25;
register[9]=49;
register[10]=64;
register[11]=41;
register[12]=99;
register[13]=78;
register[14]=22;
register[15]=97;
register[16]=121;
register[17]=143;
register[18]=8;
register[19]=77;
register[20]=19;
register[21]=54;
register[22]=37;
register[23]=73;
register[24]=84;
register[25]=29;
register[26]=15;
register[27]=76;
register[28]=12;
register[29]=103;
register[30]=109;
register[31]=1;
end

always @(posedge clk) begin
if (rst)begin
 for(k=0; k<32; k=k+1)begin
                register[k] <= 32'b0000;
                end
end
else if (regwrite)begin
    register[rd] <= write_data;
    end
end

assign read_data1 = register[rs1];
assign read_data2 = register[rs2];

endmodule
