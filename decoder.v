// Code your design here
module Decoder(input a, input b,input en, output D0,D1,D2,D3);
  wire Na,Nb;
  wire W0,W1,W2,W3;
  not(Na,a);
  not(Nb,b);
  and(W0,Na,Nb,en);
  and(W1,Na,b,en);
  and(W2,a,Nb,en);
  and(W3,a,b,en);
  assign D0=W0;
  assign D1=W1;
  assign D2=W2;
  assign D3=W3;
endmodule