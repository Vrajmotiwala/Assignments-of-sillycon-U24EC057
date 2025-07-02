module D_flipflop(input D,input CLK,input RES ,output reg Q );
  initial Q=0;
  always @(negedge CLK or negedge RES) begin
    if (!RES) begin
      Q<=0;
    end else 
      Q<=D;
 end
endmodule
    
  
module SISO(input CLK,input si,input RES,output so);
  wire [3:0] Q;
  D_flipflop f1(si,CLK,RES,Q[0]);
  D_flipflop f2(Q[0],CLK,RES,Q[1]);
  D_flipflop f3(Q[1],CLK,RES,Q[2]);
  D_flipflop f4(Q[2],CLK,RES,Q[3]);
  assign so = Q[3];
endmodule
  
  