module cnt (
    rst,
    clk,
    skip,
    out,
    outclk
);

  input rst, clk;
  input [31:0] skip;
  output outclk;
  output [3:0] out;
  reg clkreg;
  reg [31:0] tmp2;
  reg [3:0] out, tmp;

  always @(posedge clk or negedge rst) begin
    if (!rst) begin
      out <= 4'b0000;
      tmp <= 4'b0000;
    end else begin
      if (!tmp2 && !clkreg) begin
        tmp <= tmp + 1;
        out <= tmp;
      end
    end
  end

  always @(posedge clk or negedge rst) begin
    if (!rst) begin
      clkreg <= 0;
      tmp2   <= 0;
    end else begin
      tmp2 <= tmp2 + 1;
      if (tmp2 == skip) tmp2 <= 0;
      else if (tmp2 == 0) clkreg <= ~clkreg;
    end
  end

  assign outclk = clkreg;

endmodule
