// Code your design here
module multifunctional_barrel_shifter(input [31:0] A,input [4:0] shift, input L, output [31:0] B);
  wire [31:0] Rstage1 , Rstage2, Rstage3, Rstage4 , Rstage5;
  wire [31:0] Lstage1 , Lstage2, Lstage3, Lstage4 , Lstage5;
    
  assign Lstage1 = shift[0]?{A[30:0],A[31]}:A;
  assign Lstage2 = shift[1]?{Lstage1[29:0],Lstage1[31:30]}:Lstage1;
  assign Lstage3 = shift[2]?{Lstage2[27:0],Lstage2[31:28]}:Lstage2;
  assign Lstage4 = shift[3]?{Lstage3[23:0],Lstage3[31:24]}:Lstage3;
  assign Lstage5 = shift[4]?{Lstage4[15:0],Lstage4[31:16]}:Lstage4;
    
  assign Rstage1 = shift[0]?{A[0],A[31:1]}:A;
  assign Rstage2 = shift[1]?{Rstage1[1:0],Rstage1[31:2]}:Rstage1;
  assign Rstage3 = shift[2]?{Rstage2[3:0],Rstage2[31:4]}:Rstage2;
  assign Rstage4 = shift[3]?{Rstage3[7:0],Rstage3[31:8]}:Rstage3;
  assign Rstage5 = shift[4]?{Rstage4[15:0],Rstage4[31:16]}:Rstage4;
  
  //0 for right shift and 1 for left shift
  assign B=L?Lstage5:Rstage5;
  

endmodule
   

   