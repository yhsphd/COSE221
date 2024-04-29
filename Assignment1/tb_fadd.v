// Test Bench - Full Adder

`timescale 1ns/1ns

module tb_fadd();

reg x, y, c_in;
wire s_out, c_out;

fadd u0(s_out, c_out, x, y, c_in);

initial
begin
x=0; y=0; c_in=0;
#100; x=0; y=1; c_in=0;
#100; x=1; y=0; c_in=0;
#100; x=1; y=1; c_in=0;
#100; x=0; y=0; c_in=1;
#100; x=0; y=1; c_in=1;
#100; x=1; y=0; c_in=1;
#100; x=1; y=1; c_in=1;
end

endmodule
