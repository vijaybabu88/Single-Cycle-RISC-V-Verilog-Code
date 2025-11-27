
////////////------------DATA MEMORY-------------///////////

module data_memory(
        input clk,rst,
        input memWrite,memRead,
        input [31:0]read_addr,write_data,
        output [31:0]memData_out);
integer k;
reg [31:0]data_memory[63:0];

always@(posedge clk)begin
if (rst)begin
    for(k=0;k<64;k=k+1)begin
        data_memory[k] <= 32'b0000;
        end
    end

  else if (memWrite)begin
      data_memory[read_addr] <= write_data;
      end
end
assign memData_out = (memRead) ? data_memory[read_addr] : 32'b0000;
endmodule



