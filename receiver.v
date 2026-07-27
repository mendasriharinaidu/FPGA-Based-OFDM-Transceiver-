module reciever(clk,data_in,valid_in,t_valid,t_last,t_data,t_ready,config_valid,config_ready,data_out,last2,valid2,ready2,i,q,bits_out);
input clk; 
input [15:0]data_in;
input valid_in;
output reg t_valid,t_last;
output reg [15:0]t_data;
output t_ready;
output config_ready;
output reg config_valid;
output ready2;
output last2;
output valid2;
output [15:0]data_out;
output [7:0]i,q;
output [1:0]bits_out;

reg cfg_done=0;
always @(posedge clk) begin
    if(!cfg_done) begin
        config_valid <= 1;
        if(config_ready) begin
            config_valid <= 0;
            cfg_done <= 1;
        end
    end
end

assign ready2=1;

reg [3:0]count=0;
reg state=0;
parameter s0=0,s1=1;

always@(posedge clk)
case(state)
s0:if(valid_in)
   begin
   t_valid<=0;
   t_last<=0;
   t_data<=0;
   count<=count+1;
   if(count==1)
   state<=s1;
   end 
   else
   begin
   t_valid<=0;
   t_last<=0;
   t_data<=0;
   count<=0;
   end
s1:if(valid_in)
   begin
   t_valid<=1;
   t_data<=data_in;
   count<=count+1;
   if(count==9)
   begin
   t_last<=1;
   state<=s0;
   count<=0;
   end
   end
endcase
   
xfft_1 f2(.aclk(clk),
          .s_axis_data_tdata(t_data),
          .s_axis_data_tlast(t_last),
          .s_axis_data_tvalid(t_valid),
          .s_axis_data_tready(t_ready),
          .s_axis_config_tdata(8'b00000000),
          .s_axis_config_tvalid(config_valid),
          .s_axis_config_tready(config_ready),
          .m_axis_data_tdata(data_out),
          .m_axis_data_tlast(last2),
          .m_axis_data_tready(ready2),
          .m_axis_data_tvalid(valid2),
          .event_frame_started(),
          .event_tlast_unexpected(),
          .event_tlast_missing(),
          .event_status_channel_halt(),
          .event_data_in_channel_halt(),
          .event_data_out_channel_halt());  

QPSK_Demod f(clk,data_out,i,q,bits_out);

endmodule

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

module QPSK_Demod(clk,data_in,i,q,bits_out);
input clk;
input [15:0]data_in;
output signed[7:0]i,q;
output reg [1:0]bits_out;

assign i=data_in[15:8];
assign q=data_in[7:0];

always@(*)
begin
if(i==8'd8 && q==8'd8)
bits_out<=2'b00;
else if(i==-8'd8 && q==8'd8)
bits_out<=2'b01;
else if(i==8'd8 && q==-8'd8)
bits_out<=2'b10;
else if(i==-8'd8 && q==-8'd8)
bits_out<=2'b11;
else
bits_out<=2'b00;
end 

endmodule



