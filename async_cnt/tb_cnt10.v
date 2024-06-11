`timescale 1ns / 1ns

module tb_cnt10;

  reg rst;
  reg clk;
  wire [3:0] out0;
  wire clk0;

  cnt10 u0 (
      rst,
      clk,
      out0,
      clk0
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
