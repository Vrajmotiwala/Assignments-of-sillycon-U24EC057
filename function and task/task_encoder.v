module fun_encoder(input I1,input I2,input I3,input I4,input I5,input I6,input I7,input I8,output val,output [2:0] D);
  reg [2:0] O;
  task  encode;
    input Z1,Z2,Z3,Z4,Z5,Z6,Z7,Z8;
    output reg [2:0] E;
    begin
      E[0]=Z2|Z4|Z6|Z8;
      E[1]=Z3|Z4|Z7|Z8;
      E[2]=Z5|Z6|Z7|Z8;
    end
  endtask
  always @(*) begin
    encode(I1,I2,I3,I4,I5,I6,I7,I8,O);
  end 
  assign D= O;
  assign val=I1|I2|I3|I4|I5|I6|I7|I8;
endmodule
 
    