// Code your design here
module D_flipflop(input D,input CLK,input RES ,output reg Q );
  initial Q=0;
  always @(negedge CLK or negedge RES) begin
    if (!RES) begin
      Q<=0;
    end else 
      Q<=D;
 end
endmodule
 

module mealyfsm(input CLK,input A,input B,input I,output Qa, output Qb, output Y);
  wire R,T,Da,Db;
  or g1(R,A,B);
  and g2(Da,R,I);
  nor g3(T,A,B);
  and g4(Db,T,I);
  D_flipflop f1(Da,CLK,1'b1,Qa);
  D_flipflop f2(Db,CLK,1'b1,Qb);
 assign Y=B;
endmodule
  
  