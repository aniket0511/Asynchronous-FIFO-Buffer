module readblock(rclk,rptr,w_rptr,empty);
  input  rclk;
  input  [4:0] rptr,w_rptr;
  output reg empty;
  
  always@(posedge rclk)
    begin
      
      if(rptr[3:0]==w_rptr[3:0] && rptr[4]==w_rptr[4])
        	empty = 1;
      else
        	empty = 0;
      
    end
  
  
endmodule

                  
