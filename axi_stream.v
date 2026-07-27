module axi_stream(clk,i,q,symbol_valid,t_data,t_valid,t_last,t_ready,config_valid,config_ready,data_out,last2,valid2,ready2);

input clk;
input [7:0]i,q;
input symbol_valid;
reg [2:0]count;
output reg [15:0]t_data;
output reg t_valid=0;
output reg t_last=0;
output t_ready;
output config_ready;
output reg config_valid;
output ready2;
output last2;
output valid2;
output [15:0]data_out;

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

always@(posedge clk)
if(symbol_valid==1)
begin
t_data<={i,q};
t_valid<=1;
count<=count+1;
if(count==7)
t_last<=1;
end
else
begin
t_data<=0;
t_valid<=0;
t_last<=0;
count<=0; 
end

xfft_0 f1(.aclk(clk),
          .s_axis_data_tdata(t_data),
          .s_axis_data_tlast(t_last),
          .s_axis_data_tvalid(t_valid),
          .s_axis_data_tready(t_ready),
          .s_axis_config_tdata(8'b00000001),
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
            
endmodule
