// Code your design here
module booth_multiplier_32(input  signed [31:0] M,
                        input  signed [31:0] q,
                        output reg signed  [63:0] z);
  reg signed [63:0] c;
  reg signed [31:0] Qr;
  reg Qn_1;
  integer i;
  always @(*) begin
    c=64'd0;
    Qr=q;
    Qn_1=1'b0;
    c[31:0]=Qr;
    for(i=0;i<32;i++) begin
    case({Qr[0],Qn_1})
      2'b01:begin
        c[63:32]=c[63:32] + M;
      end
      2'b10: begin
        c[63:32]=c[63:32] - M;
      end
      default: ;
    endcase
    Qn_1=Qr[0];
    Qr=Qr>>1;
      Qr[31]=c[32];
    c=c >>> 1;
  end
    z=c;
  end
endmodule



  
