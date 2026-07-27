module wr_pointer(clk,wr,addr);
input clk;
input wr;
output reg [7:0]addr=0;
always@(posedge clk)
if(wr)
begin
if(addr<7)
addr<=addr+1;
else if(addr==7)
addr<=0;
end
endmodule
