
module fifo_mem(wdata,rdata,waddr,raddr,wclk,rclk,wen,ren,full,empty);
  
  input  full,empty;
  input  [7:0] wdata;
  output reg [7:0] rdata;
 	input  wen,ren,wclk,rclk;
  input  [4:0] waddr,raddr;
  
  reg [4:0] waddr1,raddr1;
  
  reg [7:0] memory[0:15];
  
  initial
  begin
    waddr1=waddr;
    raddr1=raddr;
    end

  
  always@(posedge wclk)
    begin
      
      if(full==0 && wen==1 && ren==0)
        begin
        	memory[waddr1] = wdata;
          	waddr1=waddr1+1;
        end
         
    end
  
  always@(posedge rclk)
    begin
      
      if(empty==0 && wen==0 && ren==1)
        begin
          rdata = memory[raddr1];
          raddr1=raddr1+1;
        end
      
    end
  
    assign waddr=waddr1;
    assign raddr=raddr1;
  
  
  
endmodule
