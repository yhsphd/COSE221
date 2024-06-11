module counter(rst, in_clk, q);
  input in_clk, rst;

  output [3:0]q;

  reg [3:0]q, temp;
  
  always@(posedge in_clk or negedge rst)
  begin
    if(!rst)
	begin
      temp<=0;
      q<=0;    
    end    
    else
	begin 

      if(temp == 9)
        temp <= 0;
      else
        temp<=temp+1;

      q <= temp;
    end 
     
  end  
endmodule 
