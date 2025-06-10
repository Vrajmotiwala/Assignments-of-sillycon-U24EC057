// Code your design here
module fulladder(input a, input b, input c_in,output reg s,output reg c);
  always @(*)
    begin
      s=a^b^c_in;
      c=(a&b)|(b&c_in)|(a&c_in);
    end
endmodule
