/////////////PROGRAM COUNTER///////////////////
module program_counter(
    input clk,rst,
    input [31:0]pc_in,
    output reg [31:0]pc_out);

always @(posedge clk) begin
if (rst)
    pc_out <= 32'b00;
 else
     pc_out <= pc_in;

end
endmodule

////// PC+4///////

module pcplus4 (input [31:0]fromPC, output [31:0]nextoPC);
assign nextoPC = fromPC+4;
endmodule
