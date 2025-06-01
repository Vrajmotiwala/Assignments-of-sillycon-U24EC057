// Code your design here
module fulladder(input a, input b,input c_in, output s, output c);
  wire n1,n2,n3;
  xor(n1,a,b);
  xor(s,n1,c_in);
  and(n2,a,b);
  and(n3,n1,c_in);
  or(c,n2,n3);
endmodule
  