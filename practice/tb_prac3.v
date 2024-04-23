// Test Bench - prac3

`timescale 1ns/1ns

module tb_prac3();

reg x, y;
wire s0, c0, s1, c1;


hadd1 u0(.s(s0), .c(c0), .x(x), .y(y));
hadd2 u1(.s(s1), .c(c1), .x(x), .y(y));


initial
begin
{y,x}=0;
#100; {y,x}=1;
#100; {y,x}=2;
#100; {y,x}=3;
end

endmodule