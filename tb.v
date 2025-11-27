
module tb();
reg clk,rst;

top DUT(.clk(clk),.rst(rst));

always #5 clk = !clk;

initial begin 
clk=0;
rst=1;
#20;
rst=0;
end
initial begin
#12;
$stop;
end

endmodule
