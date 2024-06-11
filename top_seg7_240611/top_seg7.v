module top_seg7 (
    rst,
    up,
    clk,
    seg1,
    seg2
);
  input rst, up, clk;

  output [6:0] seg1, seg2;

  wire [6:0] digit;
  wire out_clk;

  // 50MHz -> 1Hz  divide
  clk_dll u0 (
      rst,
      clk,
      out_clk
  );

  // counter 
  counter u1 (
      rst,
      up,
      out_clk,
      digit
  );

  // 7-segment decoder   
  seg7 u2 (
      digit / 10,
      seg1
  );
  seg7 u3 (
      digit % 10,
      seg2
  );

endmodule
