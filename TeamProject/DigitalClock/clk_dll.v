module clk_dll (
    rst,
    clk,
    quick,
    toggle,
    out_clk
);

  input rst, clk, quick, toggle;
  output reg out_clk;

  reg [24:0] half_cycle;
  parameter half_cycle_orig = 24999999;
  parameter half_cycle_quick = 249999;

  reg enabled;
  reg [24:0] cnt_clk;

  always @(posedge toggle) begin
    enabled <= !enabled;
  end

  always @(quick) begin
    case (quick)
      0: half_cycle <= half_cycle_orig;
      1: half_cycle <= half_cycle_quick;
    endcase
  end

  always @(posedge clk or negedge rst) begin
    if (!rst) begin
      out_clk <= 0;
      cnt_clk <= 0;
    end else if (enabled) begin
      cnt_clk <= cnt_clk + 1;
      if (cnt_clk == half_cycle) cnt_clk <= 0;
      else if (cnt_clk == 0) out_clk <= !out_clk;
    end
  end

endmodule
