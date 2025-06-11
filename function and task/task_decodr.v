module fun_decode(input A,input B, input C, output [7:0] D);
  reg [7:0] E;
  task  decode;
    input X,Y,Z;
    output reg [7:0] O;
    begin
      O[0]=~X&~Y&~Z;
      O[1]=~X&~Y&Z;
      O[2]=~X&Y&~Z;
      O[3]=~X&Y&Z;
      O[4]=X&~Y&~Z;
      O[5]=X&~Y&Z;
      O[6]=X&Y&~Z;
      O[7]=X&Y&Z;
    end
  endtask
  always @(*) begin
    decode(A,B,C,E);
  end
  assign D=E;
endmodule