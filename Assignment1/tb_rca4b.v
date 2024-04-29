// Test Bench - 4-Bit Ripple Carry Adder

`timescale 1ns/1ns

module tb_rca4b();

reg [3:0] x, y;
reg c_in;
wire [3:0] sum;
wire c_out;

rca4b u0(sum, c_out, x, y, c_in);

initial
begin
x=0; y=0; c_in=0;
#100; x=7; y=9; c_in=1;
#100; x=13; y=7; c_in=0;
#100; x=6; y=8; c_in=1;
#100; x=4; y=2; c_in=0;
#100; x=9; y=5; c_in=1;
#100; x=11; y=14; c_in=1;
// Required Test Case
#100; x=15; y=15; c_in=0;
end

endmodule
