// Code your design here
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


module moore_fsm(input CLK, input A,input B, input I, output Qa, output Qb,output Y);
  wire R,T,Da,Db;
  assign Db = I;
  and(R,B,~I);
  and(T,A,~B,I);
  or(Da,R,T);
  and(Y,A,B);
  D_flipflop f1(Da,CLK,1'b1,Qa);
  D_flipflop f2(Db,CLK,1'b1,Qb);
  endmodule
  