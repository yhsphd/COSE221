module async_cnt (
    rst,
    clk,
    out0,
    out1,
    out2,
    out3
);

  input rst, clk;
  output [3:0] out0, out1, out2, out3;
  wire clk1, clk2, clk3;

  cnt10 u0 (
      rst,
      clk,
      out0,
      clk1
  );
  cnt10 u1 (
      rst,
      clk1,
      out1,
      clk2
  );
  cnt10 u2 (
      rst,
      clk2,
      out2,
      clk3
  );
  cnt10 u3 (
      rst,
      clk2,
      out3
  );

endmodule
