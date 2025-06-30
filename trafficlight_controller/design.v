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

// 00 = red
// 01 = green 
// 10 = yellow

module light_controller(input A, input B, input CLK,input RES1,input RES2, output Qa, output Qb);
  wire Da,Db;
  assign Da=B;
  assign Db=~A&~B;
  D_flipflop f1(Da,CLK,RES1,Qa);
  D_flipflop f2(Db,CLK,RES2,Qb);
endmodule