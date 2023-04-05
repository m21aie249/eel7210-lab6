
`include "rlencoding.v"
`timescale 1us/1us

module rle_test;
reg [7:0] data_in;
reg fast_clk,data_clk,data_in_valid,reset,read_signal,write_signal,data_clk1;
wire [7:0] data_out,readptr,writeptr;
wire data_out_valid;
wire [2:0] output1;

rlencoding xxx(
.reset(reset),
.fast_clk(fast_clk),
.data_clk(data_clk),
.data_in_valid(data_in_valid),
.data_in(data_in),
.data_out(data_out),
.data_out_valid(data_out_valid),
.read_signal(read_signal),
.write_signal(write_signal),
.readptr(readptr),
.writeptr(writeptr),
.output1(output1),
.data_clk1(data_clk1)
);

initial begin
$dumpfile("nehru.vcd");
$dumpvars(0,rle_test);
 data_clk <= 1'b0;
 data_in <= 8'b0;
 data_in_valid <= 1'b0;
 fast_clk <= 1'b0;
 reset <= 1'b1;
 read_signal <= 1'b0;
 write_signal <= 1'b0;
 data_clk1 <= 1'b0;
 #11000 $finish;
 
end
 
always begin
#20 data_clk = 1;
#20 data_clk = 0;
end
always begin
#5 fast_clk = 0;
#5 fast_clk = 1;
end
always begin
#10 data_in_valid = 1;
end
always begin
#18 reset = 0;
end
always begin
#10 write_signal = 1;
#500 write_signal = 0;
#11000 write_signal = 1;
end
always begin
#17 data_clk1 = 1;
#6 data_clk1 = 0;
#17 data_clk1 = 0;
end

always begin
#15 data_in <= 8'b10001000;
#40 data_in <= 8'b10001000;
#40 data_in <= 8'b10001000;
#40 data_in <= 8'b10001000;
#40 data_in <= 8'b11001000;
#40 data_in <= 8'b11101000;
#40 data_in <= 8'b11111000;
end
always begin
#600 read_signal <= 1'b1; 
//#200 read_signal <= 1'b0;
//#11000 read_signal <= 1'b1;
end

endmodule
