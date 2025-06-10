// Code your design here
module Decoder(input a, input b,input c,input en, output D0,D1,D2,D3,D4,D5,D6,D7);
  wire Na,Nb,Nc;
  wire W0,W1,W2,W3,W4,W5,W6,W7;
  not(Na,a);
  not(Nb,b);
  not(Nc,c);
  and(W0,Na,Nb,Nc,en);
  and(W1,Na,Nb,c,en);
  and(W2,Na,b,Nc,en);
  and(W3,Na,b,c,en);
  and(W4,a,Nb,Nc,en);
  and(W5,a,Nb,c,en);
  and(W6,a,b,Nc,en);
  and(W7,a,b,c,en);
  assign D0=W0;
  assign D1=W1;
  assign D2=W2;
  assign D3=W3;
  assign D4=W4;
  assign D5=W5;
  assign D6=W6;
  assign D7=W7;
endmodule
  