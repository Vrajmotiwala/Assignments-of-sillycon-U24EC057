// Code your testbench here
// or browse Examples
module testbench();
  reg [31:0] A;
  reg [4:0] shift;
  reg L;
  wire [31:0] B;
  integer i;
  
  multifunctional_barrel_shifter uut(.A(A),
                           .B(B),
                          .L(L),
                           .shift(shift));
  
   initial begin 
     $dumpfile("testbench.vcd");
     $dumpvars(0,testbench);
     
     L=0;
     A=32'b0010_1101_1001_0011_1111_1011_0001_1010;
     for(i=0;i<32;i++) begin
       shift = i;
       #5;
     end
     L=1;
     for(i=0;i<32;i++) begin
       shift = i;
       #5;
     end
     $finish;
   end
endmodule