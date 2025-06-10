// Code your design here
module demux(input A,input S,output O1, output O2);
  wire E;
  not (E, S);
  and(O1,A,E);
  and(O2,A,S);
endmodule 