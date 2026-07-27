module OFDM(clk,start,symbol_valid,parallel_out,i,q,t_data,t_valid,t_last,t_ready,config_valid,config_ready,data_out,last2,valid2,ready2,cycle,wr,rd,wr_addr,rd_addr,final_out,valid_out,t_valid1,t_last1,t_data1,t_ready1,config_valid1,config_ready1,ifft_out,last3,valid3,ready3,i_out,q_out,bits_out);

input clk;
input start;
wire symbol_valid;
wire [1:0]parallel_out;
wire [7:0]i,q;
wire [15:0]t_data;
wire t_valid;
wire t_last;
wire t_ready;
wire config_ready;
wire config_valid;
wire ready2;
wire last2;
wire valid2;
wire [15:0]data_out;
wire [1:0]cycle;
wire wr,rd;
wire [7:0]wr_addr,rd_addr;
wire [15:0]final_out;
wire valid_out;

wire [15:0]t_data1;
wire t_valid1;
wire t_last1;
wire t_ready1;
wire config_ready1;
wire config_valid1;
wire ready3;
wire last3;
wire valid3;
wire [15:0]ifft_out;

output [7:0]i_out,q_out;
output [1:0]bits_out;


LFSR a(clk,start,symbol_valid,parallel_out);
QPSK_Mod b(parallel_out,i,q);
axi_stream c(clk,i,q,symbol_valid,t_data,t_valid,t_last,t_ready,config_valid,config_ready,data_out,last2,valid2,ready2);
cyclic_prefix d(clk,valid2,last2,data_out,cycle,wr,rd,wr_addr,rd_addr,final_out,valid_out);

reciever e(clk,final_out,valid_out,t_valid1,t_last1,t_data1,t_ready1,config_valid1,config_ready1,ifft_out,last3,valid3,ready3,i_out,q_out,bits_out);

endmodule
