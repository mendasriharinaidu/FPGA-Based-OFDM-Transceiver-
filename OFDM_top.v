module OFDM(clk,start,symbol_valid,parallel_out,i,q,t_data,t_valid,t_last,t_ready,config_valid,config_ready,data_out,last2,valid2,ready2,cycle,wr,rd,wr_addr,rd_addr,final_out,valid_out,t_valid1,t_last1,t_data1,t_ready1,config_valid1,config_ready1,ifft_out,last3,valid3,ready3,i_out,q_out,bits_out);

input clk;
input start;
output symbol_valid;
output [1:0]parallel_out;
output [7:0]i,q;
output [15:0]t_data;
output t_valid;
output t_last;
output t_ready;
output config_ready;
output config_valid;
output ready2;
output last2;
output valid2;
output [15:0]data_out;
output [1:0]cycle;
output wr,rd;
output [7:0]wr_addr,rd_addr;
output [15:0]final_out;
output valid_out;

output [15:0]t_data1;
output t_valid1;
output t_last1;
output t_ready1;
output config_ready1;
output config_valid1;
output ready3;
output last3;
output valid3;
output [15:0]ifft_out;

output [7:0]i_out,q_out;
output [1:0]bits_out;


LFSR a(clk,start,symbol_valid,parallel_out);
QPSK_Mod b(clk,parallel_out,i,q);
axi_stream c(clk,i,q,symbol_valid,t_data,t_valid,t_last,t_ready,config_valid,config_ready,data_out,last2,valid2,ready2);
cyclic_prefix d(clk,valid2,last2,data_out,cycle,wr,rd,wr_addr,rd_addr,final_out,valid_out);

reciever e(clk,final_out,valid_out,t_valid1,t_last1,t_data1,t_ready1,config_valid1,config_ready1,ifft_out,last3,valid3,ready3,i_out,q_out,bits_out);

endmodule
