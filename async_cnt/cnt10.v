module cnt10 (
    rst,
    clk,
    out0,
    clk0
);

  input rst, clk;
  output clk0;
  output [3:0] out0;
  reg out_clk;
  reg [2:0] tmp2;
  reg [3:0] out0, tmp;

  always @(posedge clk or negedge rst) begin
    if (!rst) begin
      out0 <= 4'b0000;
      tmp  <= 4'b0000;
    end else begin
      tmp  <= tmp + 1;
      out0 <= tmp;
    end
  end

  always @(posedge clk or negedge rst) begin
    if (!rst) begin
      out_clk <= 0;
      tmp2 <= 0;
    end else begin
      tmp2 <= tmp2 + 1;
      if (tmp2 == 4) tmp2 <= 0;
      else if (tmp2 == 0) out_clk <= ~out_clk;
    end
  end

  assign clk0 = out_clk;

endmodule
