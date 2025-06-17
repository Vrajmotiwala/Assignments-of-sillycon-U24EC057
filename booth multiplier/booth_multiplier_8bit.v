// Code your design here
module booth_multiplier(input  signed [7:0] M,
                        input  signed [7:0] q,
                        output reg signed  [15:0] z);
  reg signed [15:0] c;
  reg signed [7:0] Qr;
  reg Qn_1;
  integer i;
  always @(*) begin
    c=16'd0;
    Qr=q;
    Qn_1=1'b0;
    c[7:0]=Qr;
  for(i=0;i<8;i++) begin
    case({Qr[0],Qn_1})
      2'b01:begin
        c[15:8]=c[15:8] + M;
      end
      2'b10: begin
        c[15:8]=c[15:8] - M;
      end
      default: ;
    endcase
    Qn_1=Qr[0];
    Qr=Qr>>1;
    Qr[7]=c[8];
    c=c >>> 1;
  end
    z=c;
  end
endmodule



  
