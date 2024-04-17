// Test Bench - prac2

`timescale 1ns/1ns

module tb_prac2();

reg x, y, z;
wire s0, s1, s2, s3;


associative1 u0(.s(s0), .x(x), .y(y), .z(z));
associative2 u1(.s(s1), .x(x), .y(y), .z(z));
commutative1 u2(.s(s2), .x(x), .y(y), .z(z));
commutative2 u3(.s(s3), .x(x), .y(y), .z(z));


initial
begin
{z,y,x}=0;
#100; {z,y,x}=1;
#100; {z,y,x}=2;
#100; {z,y,x}=3;
#100; {z,y,x}=4;
#100; {z,y,x}=5;
#100; {z,y,x}=6;
#100; {z,y,x}=7;
end

endmodule
