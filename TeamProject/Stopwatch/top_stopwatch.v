module top_stopwatch (
    rst,
    clk,
    quick,
    start_stop,
    seg_s001,
    seg_s01,
    seg_s1,
    seg_s10,
    seg_m1,
    seg_m10
);

  input rst, clk, quick, start_stop;
  output [6:0] seg_s001, seg_s01, seg_s1, seg_s10, seg_m1, seg_m10;

  wire [6:0] value_s001, value_s, value_m;
  wire dll_clk, carry0, carry1;

  // 50MHz -> 1Hz 분주
  clk_dll u0 (
      rst,
      clk,
      quick,
      start_stop,
      dll_clk
  );

  // counters for 0.01s, s, m
  cnt_100 u1 (
      rst,
      dll_clk,
      value_s001,
      carry0
  );
  cnt_60 u2 (
      rst,
      carry0,
      value_s,
      carry1
  );
  cnt_100 u3 (
      rst,
      carry1,
      value_m
  );

  // 7-segment decoder
  seg7 s01 (
      value_s001 / 10,
      seg_s01
  );
  seg7 s001 (
      value_s001 % 10,
      seg_s001
  );

  seg7 s10 (
      value_s / 10,
      seg_s10
  );
  seg7 s1 (
      value_s % 10,
      seg_s1
  );
  
  seg7 m10 (
      value_m / 10,
      seg_m10
  );
  seg7 m1 (
      value_m % 10,
      seg_m1
  );

endmodule
