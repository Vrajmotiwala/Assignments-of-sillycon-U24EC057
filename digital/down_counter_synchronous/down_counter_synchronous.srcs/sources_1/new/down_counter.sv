// Code your design here
module T_flipflop(input T,input CLK, output reg Q );
  initial Q=0;
  always @(negedge CLK) begin
    if(T==0) begin
      Q<=Q;
    end
      else begin
        Q<=~Q;
      end
  end
endmodule


module down_counter(input CLK,output Q1,output Q2, output Q3);
  wire R;
  nor(R,Q1,Q2);
  T_flipflop f1(1'b1,CLK,Q1);
  T_flipflop f2(~Q1,CLK,Q2);
  T_flipflop f3(R,CLK,Q3);
endmodule