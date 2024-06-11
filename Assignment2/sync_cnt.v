module sync_cnt (
    rst,
    clk,
    out0,
    out1,
    out2,
    out3
);

  input rst, clk;
  output [3:0] out0, out1, out2, out3;
  wire clk0, clk1, clk2, clk3;

  cnt cnt0 (
      rst,
      clk,
      0,
      out0,
      clk0
  );
  cnt cnt1 (
      rst,
      clk,
      4,
      out1,
      clk1
  );
  cnt cnt2 (
      rst,
      clk,
      49,
      out2,
      clk2
  );
  cnt cnt3 (
      rst,
      clk,
      499,
      out3,
      clk3
  );

endmodule
