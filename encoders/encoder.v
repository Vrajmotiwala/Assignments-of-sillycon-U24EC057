// Code your design here
module encoder(input I1,input I2,input I3,input I4,output val,output D1,D2);
  wire W1,W2;
  or(val,I1,I2,I3,I4);
  or(W1,I2,I4);
  or(W2,I3,I4);
  assign D1=W1;
  assign D2=W2;
endmodule