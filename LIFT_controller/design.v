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

// 00 = first floor
// 01 = second floor
// 10 = third floor


module lift_controller(input A, input B, input I,input CLK, input RES1, input RES2, output Qa, output Qb);
  wire R,T,Da,Db;
  and(Da,~A,I);
  and(R,A,I);
  and(T,~A,~B,~I);
  or(Db,R,T);
  D_flipflop f1(Da,CLK,RES1,Qa);
  D_flipflop f2(Db,CLK,RES2,Qb);
endmodule
 
  

