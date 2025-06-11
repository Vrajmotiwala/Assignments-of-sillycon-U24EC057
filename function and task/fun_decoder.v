module fun_decode(input A,input B, input C, output [7:0] D);
  function [7:0] decode;
    input X,Y,Z;
    begin
      decode[0]=~X&~Y&~Z;
      decode[1]=~X&~Y&Z;
      decode[2]=~X&Y&~Z;
      decode[3]=~X&Y&Z;
      decode[4]=X&~Y&~Z;
      decode[5]=X&~Y&Z;
      decode[6]=X&Y&~Z;
      decode[7]=X&Y&Z;
    end
  endfunction
  assign D=decode(A,B,C);
endmodule