/////----------AND gate Logic----------////////
module and_logic(
        input branch,zero,
        output and_out);
assign and_out = branch & zero;
endmodule

//////-------Adder--------/////
module adder(
        input[31:0]in_1,in_2,
        output [31:0]sum);
assign sum = in_1+in_2;
endmodule


