// Code your design here
// Code your design here
module D_flipflop(input D,input CLK,input CLR,input PRE ,output reg Q );
  initial Q=0;
  always @(negedge CLK or negedge PRE or negedge CLR) begin
    if (!CLR) begin
      Q<=0;
    end else if (!PRE) begin
      Q<=1;
    end
    else if(D==1) begin
      Q<=1;
    end
      else begin
        Q<=0;
      end
  end
endmodule


module RING_counter(input CLK,input CLR1,input CLR2,input CLR3,input CLR4, input PRE1,input PRE2,input PRE3,input PRE4,output Q1,output Q2, output Q3,output Q4); 
  D_flipflop f1(Q4,CLK,CLR1,PRE1,Q1);
  D_flipflop f2(Q1,CLK,CLR2,PRE2,Q2);
  D_flipflop f3(Q2,CLK,CLR3,PRE3,Q3);
  D_flipflop f4(Q3,CLK,CLR4,PRE4,Q4);
endmodule
