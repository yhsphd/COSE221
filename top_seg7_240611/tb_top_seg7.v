`timescale 1ns / 1ns

module tb_top_seg7 ();
  reg rst, up, clk;
  wire [6:0] seg;

  top_seg7 u0 (
      rst,
      up,
      clk,
      seg
  );

  initial begin
    rst = 0;
    #53;
    rst = 1;
  end

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    up = 0;
    forever #124999999 up = ~up;
  end

endmodule
