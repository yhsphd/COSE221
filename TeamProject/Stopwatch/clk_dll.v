module clk_dll (
    rst,
    clk,
    quick,
    start_stop,
    out_clk
);

  input rst, clk, start_stop;
  input [3:0] quick;
  output reg out_clk;

  reg [31:0] half_cycle;
  parameter half_cycle_orig = 249999;

  reg pressed, enabled;
  reg [31:0] cnt_clk;

  always @(quick) begin
    case (quick)
      4'b0000: half_cycle <= half_cycle_orig;

      4'b1000: half_cycle <= half_cycle_orig / 10;
      4'b0100: half_cycle <= half_cycle_orig / 100;
      4'b0010: half_cycle <= half_cycle_orig / 1000;
      4'b0001: half_cycle <= half_cycle_orig / 10000;

      4'b0111: half_cycle <= (half_cycle_orig + 1) * 10 - 1;
      4'b1011: half_cycle <= (half_cycle_orig + 1) * 100 - 1;
      4'b1101: half_cycle <= (half_cycle_orig + 1) * 1000 - 1;
      4'b1110: half_cycle <= (half_cycle_orig + 1) * 10000 - 1;
    endcase
  end

  always @(posedge clk or negedge rst) begin
    if (!rst) begin
      enabled <= 0;
      out_clk <= 0;
      cnt_clk <= 0;
    end else begin
      if (pressed && !start_stop) enabled <= !enabled;
      pressed <= start_stop;

      if (enabled) begin
        cnt_clk <= cnt_clk + 1;
        if (cnt_clk >= half_cycle) cnt_clk <= 0;
        else if (cnt_clk == 0) out_clk <= !out_clk;
      end
    end
  end

endmodule
