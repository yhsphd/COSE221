// Half Adder
module hadd1(s, c, x, y);

output s, c;
input x, y;

// RTL M
assign s=x^y;
assign c=x&y;

endmodule


module hadd2(s, c, x, y);

output s, c;
input x, y;

reg s, c;

// Behavioral M
always @(x, y)
begin
s=x^y;
end

always @(x, y)
begin
if(x==0||y==0) c=0;
else           c=1;
end

always @(x, y)
begin
if(x!=y) s=1;
else     s=0;
end

endmodule
