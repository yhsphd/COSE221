// AND Gate
module and2(s, x, y);

output s;
input x, y;

// RTL M
assign s=x&y;

endmodule


// OR Gate
module or2(s, x, y);

output s;
input x, y;

// RTL M
assign s=x|y;

endmodule


// NAND Gate
module nand2(s, x, y);

output s;
input x, y;

// RTL M
assign s=~(x&y);

endmodule


// XOR Gate
module xor2(s, x, y);

output s;
input x, y;

// RTL M
assign s=x^y;

endmodule
