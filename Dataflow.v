// Code your design here
module fulladder(input a, input b, input c_in, output s, output c);
  assign s=a^b^c;
  assign c=(a&b) |(b&c_in)|(a&c_in);
 endmodule