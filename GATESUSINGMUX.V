// Code your design here
module gates_usingmux(input A,input B,output Y1,Y2,Y3,Y4,Y5,Y6);
  function MUX;
    input X,Z,S;
    begin
      MUX = (~S&X)|(S&Z);
    end
  endfunction
  //and
  assign Y1=MUX(1'b0,B,A);
  //or
  assign Y2=MUX(B,1'b1,A);
  //nand
  assign Y3=MUX(1'b1,~B,A);
  //nor
  assign Y4=MUX(~B,1'b0,A);
   //xor
    assign Y5=MUX(B,~B,A);
  //xnor
  assign Y6=MUX(~B,B,A);
endmodule