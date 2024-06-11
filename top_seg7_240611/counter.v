module counter (
    rst,
    up,
    in_clk,
    q
);
  input in_clk, rst, up;

  output [6:0] q;

  reg [6:0] q, temp;

  always @(posedge in_clk or negedge rst) begin
    if (!rst) begin
      temp <= 0;
      q <= 0;
    end else begin
      if (up) begin
        if (temp == 99) temp <= 0;
        else temp <= temp + 1;
      end else begin
        if (temp == 0) temp <= 99;
        else temp <= temp - 1;
      end

      q <= temp;
    end
  end
endmodule

