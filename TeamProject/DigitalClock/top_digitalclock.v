module top_digitalclock (
    rst,
    clk,
    quick,
    toggle,
    seg_s1,
    seg_s10,
    seg_m1,
    seg_m10,
    seg_h1,
    seg_h10
);

  input rst, clk, quick, toggle;
  output [6:0] seg_s1, seg_s10, seg_m1, seg_m10, seg_h1, seg_h10;

  wire [6:0] value_s, value_m, value_h;
  wire dll_clk, carry0, carry1;

  // 50MHz -> 1Hz 분주
  clk_dll u0 (
      rst,
      clk,
      quick,
      toggle,
      dll_clk
  );

  // counters for s, m, h
  cnt_60 u1 (
      rst,
      dll_clk,
      value_s,
      carry0
  );
  cnt_60 u2 (
      rst,
      carry0,
      value_m,
      carry1
  );
  cnt_24 u3 (
      rst,
      carry1,
      value_h
  );

  // 7-segment decoder
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
  seg7 h10 (
      value_h / 10,
      seg_h10
  );
  seg7 h1 (
      value_h % 10,
      seg_h1
  );

endmodule
