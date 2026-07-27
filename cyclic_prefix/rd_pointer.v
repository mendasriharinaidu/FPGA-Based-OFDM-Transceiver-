module rd_pointer(clk,rd,addr);
input clk;
input rd;
output reg [7:0]addr=6;
always@(posedge clk)
if(rd)
begin
if(addr<7)
addr<=addr+1;
else if(addr==7)
addr<=0;
end
else
addr<=6;
endmodule
