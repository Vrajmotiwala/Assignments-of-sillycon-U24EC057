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


module mux(input M0, input M1, input M2, input M3, input S0, input S1, output reg T);
  always @(*) begin
    case ({S1, S0})
      2'b00: T = M0;
      2'b01: T = M1;
      2'b10: T = M2;
      2'b11: T = M3;
      default: T = 1'b0;
    endcase
  end
endmodule

      
module uni_shiftregister(input I0 , input I1, input I2, input I3, input CLK,input RES,input si,input S0,input S1, output Q0,Q1,Q2, Q3);
  wire [3:0] A;
  wire Q0_int, Q1_int, Q2_int, Q3_int ;
  mux m0(Q0_int,si,Q1_int,I0,S0,S1,A[0]);
  mux m1(Q1_int,Q0_int,Q2_int,I1,S0,S1,A[1]);
  mux m2(Q2_int,Q1_int,Q3_int,I2,S0,S1,A[2]);
  mux m3(Q3_int,Q2_int,si,I3,S0,S1,A[3]);
  
  D_flipflop f0(A[0],CLK,RES,Q0_int);
  D_flipflop f1(A[1],CLK,RES,Q1_int);
  D_flipflop f2(A[2],CLK,RES,Q2_int);
  D_flipflop f3(A[3],CLK,RES,Q3_int);
  
  assign Q0=Q0_int;
  assign Q1=Q1_int;
  assign Q2=Q2_int;
  assign Q3=Q3_int;
endmodule
      