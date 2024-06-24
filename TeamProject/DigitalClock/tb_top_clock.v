`timescale 1ns / 1ns
module tb_top_clock ();

  reg rst, clk, enable;
  wire [6:0] seg_s10, seg_s1, seg_m10, seg_m1, seg_h10, seg_h1;

  top_digitalclock u0 (
      rst,
      clk,
      enable,
      seg_s10,
      seg_s1,
      seg_m10,
      seg_m1,
      seg_h10,
      seg_h1
  );

  initial begin
    rst = 0;
    #195;
    rst = 1;
  end

  initial begin
    enable = 1;
    #1000000000;
    enable = 0;
  end

  initial begin
    clk = 0;
    forever #10 clk = ~clk;	// 50MHz 주기 20ns이므로
  end

endmodule
