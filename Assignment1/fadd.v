// Full Adder
module fadd(s_out, c_out, x, y, c_in);

output s_out, c_out;
input x, y, c_in;

wire temp_sum, temp_carry_1, temp_carry_2;

// RTL M
hadd u0(.s(temp_sum), .c(temp_carry_1), .x(x), .y(y));
hadd u1(.s(s_out), .c(temp_carry_2), .x(temp_sum), .y(c_in));

assign c_out=temp_carry_1|temp_carry_2;

endmodule
