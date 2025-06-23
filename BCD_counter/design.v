module T_flipflop(input T,input CLK,input RES ,output reg Q );
  initial Q=0;
  always @(negedge CLK or negedge RES) begin
    if (!RES) begin
      Q<=0;
      end else if(T==1) begin
      Q<=~Q;
    end
      else begin
        Q<=Q;
      end
  end
endmodule

module BCD_counter(input CLK ,output Q1,output Q2 , output Q3, output Q4);
  wire R,A,Z,Y;
  and(R,Q1);
  and(A,Q2,Q1);
  and(Z,Q3,Q2,Q1);
  nand(Y,Q4,Q2);
  T_flipflop f1(Z,CLK,Y,Q4);
  T_flipflop f2(A,CLK,Y,Q3);
  T_flipflop f3(R,CLK,Y,Q2);
  T_flipflop f4(1'b1,CLK,Y,Q1);
endmodule