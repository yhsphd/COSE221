// 4-Bit Ripple Carry Adder
module rca4b(sum, c_out, x, y, c_in);

output [3:0] sum;
output c_out;
input [3:0] x, y;
input c_in;

wire [3:0] c;

fadd fa0(.s_out(sum[0]), .c_out(c[0]), .x(x[0]), .y(y[0]), .c_in(c_in));
fadd fa1(.s_out(sum[1]), .c_out(c[1]), .x(x[1]), .y(y[1]), .c_in(c[0]));
fadd fa2(.s_out(sum[2]), .c_out(c[2]), .x(x[2]), .y(y[2]), .c_in(c[1]));
fadd fa3(.s_out(sum[3]), .c_out(c[3]), .x(x[3]), .y(y[3]), .c_in(c[2]));

assign c_out = c[3];

endmodule
