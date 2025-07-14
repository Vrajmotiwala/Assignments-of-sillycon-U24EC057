// Code your design here
module lut_ram_1port#(
  parameter WIDTH=8,
  parameter DEPTH=65536
)(
  input clk,
  input rst,
  input we,
  input [$clog2(DEPTH)-1:0] addr,
  input [WIDTH-1:0] din,
  output reg [WIDTH-1:0] dout
);
  
  reg [WIDTH-1:0] lut_ram [DEPTH-1:0];

  //read
  always @(posedge clk) begin
    if (rst) begin
      dout=0;
    end else if(!we) begin
      dout<=lut_ram[addr];
    end
  end
  
//write
  always @(posedge clk) begin
    if(we)
      lut_ram[addr]<=din;
  end
endmodule
    
    

  

  
      
      
      
