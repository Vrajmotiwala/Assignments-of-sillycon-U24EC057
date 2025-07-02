// Code your design here
module SR_flipflop(input clk,input S,input R,output reg Q);
  reg Qin=0;
  always @(posedge clk) begin
    if (S==0 && R ==0) begin
      Qin=Qin;
    end else if (S==0 && R ==1) begin
      Qin=0;
    end else if (S==1 && R ==0) begin
      Qin=1;
    end else begin
      Qin=1'bx;
    end
     Q<=Qin;
  end
endmodule
    
  
module PISO(input clk,input load,input I0,input I1,input I2, input I3, output Q0,output Q1,output Q2, output Q3);
  wire [3:0] S1,R1;
  and(S1[0],load,I0);
  and(S1[1],load,I1);
  and(S1[2],load,I2);
  and(S1[3],load,I3);
  and(R1[0],load,~I0);
  and(R1[1],load,~I1);
  and(R1[2],load,~I2);
  and(R1[3],load,~I3);
  
  SR_flipflop f1(clk,S1[0],R1[0],Q0);
  SR_flipflop f2(clk,S1[1],R1[1],Q1);
  SR_flipflop f3(clk,S1[2],R1[2],Q2);
  SR_flipflop f4(clk,S1[3],R1[3],Q3);
endmodule
  
  