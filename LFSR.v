module LFSR(clk,start,symbol_valid,parallel_out);
input clk;
input start;
output reg symbol_valid;
output reg [1:0]parallel_out;

reg [7:0]shift_reg;
reg [3:0]count;
reg [1:0]state=0;
parameter s0=0,s1=1,s2=2;

always@(posedge clk)
case(state)
00: if(start==1)
    begin
    shift_reg<=8'b10101011;
    count<=0;
    symbol_valid<=0;
    state<=s1;
    end
s1: begin
    parallel_out<=shift_reg[1:0];
    shift_reg<={shift_reg[1]^shift_reg[0],shift_reg[7:1]};
    count<=count+1;
    symbol_valid<=1;
    if(count==7)
    state<=s2;
    end
s2: begin
    parallel_out<=0;
    symbol_valid<=0;
    count<=count+1;
    if(count==10)
    begin
    state<=s1;
    count<=0;
    end
    end
default : begin
    shift_reg<=8'b11110011;
    count<=0;
    symbol_valid<=0;
    state<=s1;
    end
endcase

endmodule
