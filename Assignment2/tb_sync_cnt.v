`timescale 1ns / 1ns

module tb_sync_cnt;

  reg rst;
  reg clk;
  wire [3:0] out0, out1, out2, out3;

  sync_cnt u0 (
      rst,
      clk,
      out0,
      out1,
      out2,
      out3
  );

  initial begin
    rst = 0;
    #52;
    rst = 1;
  end

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

endmodule
