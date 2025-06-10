// Code your design here
module encoder(input I1,input I2,input I3,input I4,input I5,input I6,input I7,input I8,output val,output D1,D2,D3);
  wire W1,W2,W3;
  or(val,I1,I2,I3,I4,I5,I6,I7,I8);
  or(W1,I2,I4,I6,I8);
  or(W2,I3,I4,I7,I8);
  or(W3,I5,I6,I7,I8);
  assign D1=W1;
  assign D2=W2;
  assign D3=W3;
endmodule