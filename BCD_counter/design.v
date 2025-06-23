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
  wire R;
  nand(R,Q4,Q2);
  T_flipflop f1(1'b1,Q3,R,Q4);
  T_flipflop f2(1'b1,Q2,R,Q3);
  T_flipflop f3(1'b1,Q1,R,Q2);
  T_flipflop f4(1'b1,CLK,R,Q1);
endmodule
  