module fun_encoder(input I1,input I2,input I3,input I4,input I5,input I6,input I7,input I8,output val,output [2:0] D);
  function [2:0] encode;
    input Z1,Z2,Z3,Z4,Z5,Z6,Z7,Z8;
    begin
      encode[0]=Z2|Z4|Z6|Z8;
      encode[1]=Z3|Z4|Z7|Z8;
      encode[2]=Z5|Z6|Z7|Z8;
    end
  endfunction
  assign D= encode(I1,I2,I3,I4,I5,I6,I7,I8);
  assign val=I1|I2|I3|I4|I5|I6|I7|I8;
endmodule
 
    