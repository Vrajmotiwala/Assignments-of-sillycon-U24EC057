// Code your design here
module mux(input A,input B, input S,output D);
  wire E;
  not(E,S);
  assign D=(A&E)|(B&S);
endmodule
  