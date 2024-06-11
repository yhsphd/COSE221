module top_seg7(rst, clk, seg);
  input  rst, clk;

  output[6:0] seg;

  wire[3:0] digit;
  wire out_clk;
  
  // 50MHz -> 1Hz  divide
  clk_dll u0(rst, clk, out_clk); 
  
  // counter 
  counter u1(rst, out_clk, digit); 
   
  // 7-segment decoder   
  seg7 u2(digit, seg);
  
endmodule
