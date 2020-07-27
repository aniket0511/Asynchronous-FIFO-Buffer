
module fifo(reset,wdata,rdata,wen,ren,wclk,rclk,empty,full);
  
  input [7:0] wdata;
  output  [7:0] rdata;
  input  reset,wen,ren,wclk,rclk;
  
  reg [4:0] waddr,raddr;
  
  output empty,full;
 	
 	initial
      begin
        waddr=5'b00000;
        raddr=5'b00000;
      end
  
  sync s0(reset,waddr,rclk,w_rptr);
  
  sync s1(reset,raddr,wclk,r_wptr);
  
  
  writeblock w0(wclk,waddr,r_wptr,full);
  
  readblock r0(rclk,raddr,w_rptr,empty);
  
  fifo_mem f0(wdata,rdata,waddr,raddr,wclk,rclk,wen,ren,full,empty);
  
  
  
  
  
  
  
endmodule
