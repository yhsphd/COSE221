// Test Bench - prac1_gates

`timescale 1ns/1ns

module tb_prac1();

reg x, y;
wire s0, s1, s2, s3;


and2 u0(.s(s0), .x(x), .y(y));
or2 u1(.s(s1), .x(x), .y(y));
nand2 u2(.s(s2), .x(x), .y(y));
xor2 u3(.s(s3), .x(x), .y(y));


initial
begin
x=0; y=0;
#250; x=0; y=1;
#250; x=1; y=0;
#250; x=1; y=1;
end

endmodule
