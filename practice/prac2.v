module associative1(s, x, y, z);

output s;
input x, y, z;

assign s=(x|y)|z;

endmodule

module associative2(s, x, y, z);

output s;
input x, y, z;

assign s=x|(y|z);

endmodule

module commutative1(s, x, y, z);

output s;
input x, y, z;

assign s=x|(y&z);

endmodule

module commutative2(s, x, y, z);

output s;
input x, y, z;

assign s=(x|y)&(x|z);

endmodule
