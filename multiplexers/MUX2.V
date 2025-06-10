// Code your design here
module mux(input A,input B,input C,input D, input S1,input S2,output O);
  wire E1,E2;
  not(E1,S1);
  not(E2, S2);;
  assign O=(A&E1&E2)|(B&S1&E2)|(C&S2&E1)|(D&S2&S1);
endmodule