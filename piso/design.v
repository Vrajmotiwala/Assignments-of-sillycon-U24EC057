module D_flipflop(input D,input CLK,input RES ,output reg Q );
  initial Q=0;
  always @(negedge CLK or negedge RES) begin
    if (!RES) begin
      Q<=0;
    end else 
      Q<=D;
 end
endmodule

module PISO(input CLK,input load,input RES,input I0,input I1,input I2, input I3, output Q0,output Q1,output Q2, output Q3);
  wire [3:0] S,R,T;
  and(S[0],load,Q1);
  and(S[1],load,Q2);
  and(S[2],load,Q3);
  and(S[3],load,I3);
  and(R[0],~load,I0);
  and(R[1],~load,I1);
  and(R[2],~load,I2);
  and(R[3],~load,I3);
  or(T[0],S[0],R[0]);
  or(T[1],S[1],R[1]);
  or(T[2],S[2],R[2]);
  or(T[3],S[3],R[3]);
  
  D_flipflop f1(T[0],CLK,RES,Q0);
  D_flipflop f2(T[1],CLK,RES,Q1);
  D_flipflop f3(T[2],CLK,RES,Q2);
  D_flipflop f4(T[3],CLK,RES,Q3);
endmodule
