module binary_gray(in,out);
  input  [4:0] in;
  output  [4:0] out;
  

  assign out[4]=in[4];
  assign out[3]=in[4]^in[3];
  assign out[2]=in[3]^in[2];
  assign out[1]=in[2]^in[1];
  assign out[0]=in[1]^in[0];
  
endmodule



module dff(reset,clk,in,out);
  
  input  reset,clk;
  input  [4:0] in;
  output reg [4:0] out;
  
  always@(posedge clk)
    begin
      if(reset)
        out <= 5'b00000;
      else
        out <= in;
    end
  
  
endmodule



module sync(reset,in,clk,out);
  input [4:0] in;
  output [4:0] out;
  input clk;
  wire [4:0] ptr,out1,ou2;
  input reset;
  
  binary_gray bg0(in,ptr);
  
  dff d0(reset,clk,ptr,out1);
  dff d1(reset,clk,out1,out2);
  
  assign out=out2;
  
  
  
endmodule
