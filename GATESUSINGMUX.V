// Code your design here
module and_usingmux(input A,input B,output Y);
  assign Y= (A==1'b0)?1'b0:B;
endmodule

module or_usingmux(input A,input B,output Y);
  assign Y= (A==1'b0)?B:1'b1;
endmodule

module nand_usingmux(input A,input B,output Y);
  assign Y=(A==1'b0)?1'b1:~B;
endmodule

module nor_usingmux(input A,input B,output Y);
  assign Y=~(A|B);
endmodule

module xor_usingmux(input A,input B,output Y);
  assign Y=(A==1'b0)?B:~B;
endmodule

module xnor_usingmux(input A,input B,output Y);
  assign Y=(A==1'b0)?~B:B;
endmodule