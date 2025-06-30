module D_flipflop(input D,input CLK,input RES ,output reg Q );
  initial Q=0;
  always @(negedge CLK or negedge RES) begin
    if (!RES) begin
      Q<=0;
    end else 
      Q<=D;
 end
endmodule


module pattern_detector(input CLK, input A,input B,input RES, input I, output Qa, output Qb,output Y);
  wire Da,Db;
  and(Da,B,~I);
  and(Db,~A,I);
  D_flipflop f1(Da,CLK,RES,Qa);
  D_flipflop f2(Db,CLK,RES,Qb);
  assign Y=Qa&~Qb&I;
  endmodule
  