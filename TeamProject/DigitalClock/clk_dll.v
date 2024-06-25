module clk_dll (
    rst,
    clk,
    quick,
    out_clk
);

  input rst, clk;
  input [3:0] quick;
  output reg out_clk;

  reg [24:0] half_cycle;
  parameter half_cycle_orig = 24999999;

  reg [24:0] cnt_clk;

  always @(quick) begin
    case (quick)
      4'b0000: half_cycle <= half_cycle_orig;
      4'b1000: half_cycle <= half_cycle_orig / 10;
      4'b0100: half_cycle <= half_cycle_orig / 100;
      4'b0010: half_cycle <= half_cycle_orig / 1000;
      4'b0001: half_cycle <= half_cycle_orig / 10000;
    endcase
  end

  always @(posedge clk or negedge rst) begin
    if (!rst) begin
      out_clk <= 0;
      cnt_clk <= 0;
    end else begin
      cnt_clk <= cnt_clk + 1;
      if (cnt_clk >= half_cycle) cnt_clk <= 0;
      else if (cnt_clk == 0) out_clk <= !out_clk;
    end
  end

endmodule
