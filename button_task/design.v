// Code your design here
module taskb( input button,input CLK, output reg pulse);
  initial pulse=0;
  reg prev;
  initial prev=0;
  always @(posedge CLK) begin
    prev <= button;
    pulse <= button & ~prev;
  end
  endmodule
    