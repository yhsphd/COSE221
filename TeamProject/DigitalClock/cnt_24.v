module cnt_24 (
    rst,
    clk,
    value,
    out_clk
);

  input rst, clk;

  output reg [6:0] value;
  output reg out_clk;

  always @(posedge clk or negedge rst) begin
    if (!rst) begin
      value <= 0;
      out_clk <= 0;
    end else begin
      value <= value + 1;
      if (value == 11) begin
        out_clk <= 0;
      end else if (value == 23) begin
        value <= 0;
        out_clk <= 1;
      end
    end
  end
  
endmodule
