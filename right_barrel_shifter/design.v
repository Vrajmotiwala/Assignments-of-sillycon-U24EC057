// Code your design here
module Right_barrel_shifter(input [31:0] A,input [4:0] shift, output [31:0] B);
  wire [31:0] stage1 , stage2, stage3, stage4 ,stage5;
    
  assign stage1 = shift[0]?{A[0],A[31:1]}:A;
  assign stage2 = shift[1]?{stage1[1:0],stage1[31:2]}:stage1;
  assign stage3 = shift[2]?{stage2[3:0],stage2[31:4]}:stage2;
  assign stage4 = shift[3]?{stage3[7:0],stage3[31:8]}:stage3;
  assign stage5 = shift[4]?{stage4[15:0],stage4[31:16]}:stage4;
  
  assign B = stage5;
endmodule
   