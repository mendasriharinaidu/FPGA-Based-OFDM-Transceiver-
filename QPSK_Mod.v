module QPSK_Mod(in,i,q);
input [1:0]in;
output reg signed[7:0]i,q;

always@(*)
case(in)
2'b00:begin
      i=8'd1; q=8'd1;
      end
2'b01:begin
      i=-8'd1; q=8'd1;
      end   
2'b10:begin
      i<=8'd1; q<=-8'd1;
      end
2'b11:begin
      i<=-8'd1; q<=-8'd1;
      end
endcase

endmodule
