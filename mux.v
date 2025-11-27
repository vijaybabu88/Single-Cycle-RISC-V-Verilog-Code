//////////--------------Multiplexers---------------//////////
module mux1(
      input sel1,
      input [31:0]A1,B1,
      output [31:0]mux1_out);
assign mux1_out = (sel1==1'b0) ? A1:B1;
endmodule
////// MUX 2 ///////
module mux2(
      input sel2,
      input [31:0]A2,B2,
      output [31:0]mux2_out);
assign mux2_out = (sel2==1'b0) ? A2:B2;
endmodule
///////// MUX 3////////
module mux3(
      input sel3,
      input [31:0]A3,B3,
      output [31:0]mux3_out);
assign mux3_out = (sel3==1'b0) ? A3:B3;
endmodule


