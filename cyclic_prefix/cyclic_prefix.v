module cyclic_prefix(clk,valid,last,data_in,cycle,wr,rd,wr_addr,rd_addr,data_out,valid_out);

input clk;
input valid,last;
input [15:0]data_in;
output reg [1:0]cycle=0;
output wr,rd;
output [7:0]wr_addr,rd_addr;
output reg [15:0]data_out;
output reg valid_out;
reg[15:0]mem[0:7];

always@(posedge valid)
if(cycle<3)
cycle<=cycle+1;
else if(cycle==3)
cycle<=3;

assign wr=valid;
assign rd=((cycle==0)||(cycle==1)||(cycle==2&&valid==1))?0:!last;

wr_pointer a(clk,wr,wr_addr);
rd_pointer b(clk,rd,rd_addr);

always@(posedge clk)
if(wr)
mem[wr_addr]<=data_in;

always@(posedge clk)
if(rd)
begin
data_out<=mem[rd_addr];
valid_out<=1;
end
else
valid_out<=0;

endmodule
