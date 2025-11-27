
///////////////------------ALU-------------///////////////
module ALU_unit(
 input [31:0] A,
    input [31:0] B,
    input [3:0]control_in,
    output reg [31:0]result,
    output reg zero );

always @(*)begin
case (control_in)
    4'b0000 : begin zero<=0; result <= A&B;  end
    4'b0001 : begin zero<=0; result <= A|B;  end
    4'b0010 : begin zero<=0; result <= A+B;  end
    4'b0110 : begin if (A==B)zero<=1; else zero <=0; result <= A-B;  end
    default :begin zero<=0; result<= 31'bxxxx;end
  endcase
end
endmodule
