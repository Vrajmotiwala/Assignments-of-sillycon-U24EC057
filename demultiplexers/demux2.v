// Code your design here
module demux(input A,input S1,input S2,output O1, output O2,output O3,output O4 );
  wire E1,E2;
  not (E1, S1);
  not (E2, S2);
  and(O1,A,E1,E2);
  and(O2,A,S1,E2);
  and(O3,A,E1,S2);
  and(O4,A,S1,S2);
endmodule 