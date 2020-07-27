module writeblock(wclk,wptr,r_wptr,full);
  input  wclk;
  output reg full;
  input  [4:0] wptr,r_wptr;
  
  
  always@(posedge wclk)
    begin
      
      if(wptr[3:0]==r_wptr[3:0] && wptr[4]!=r_wptr[4])
        	full = 1;
      else
        	full = 0;
      
    end
  
  
endmodule

                  
