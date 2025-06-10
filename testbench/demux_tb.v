// Code your testbench here
// or browse Examples
module demux_tb;
  reg A,S1,S2;
  wire O1,O2,O3,O4;
  demux uut(.A(A),.S1(S1),.S2(S2),.O1(O1),.O2(O2),.O3(O3),.O4(O4));
  initial begin
    $dumpfile("demux_tb.vcd");
    $dumpvars(0,demux_tb);
    A=0;S1=0;S2=0;
    #10
    A=0;S1=1;S2=0;
    #10
    A=1;S1=0;S2=0;
    #10
    A=1;S1=1;S2=0;
    #10
    A=0;S1=0;S2=1;
    #10
    A=0;S1=1;S2=1;
    #10
    A=1;S1=0;S2=1;
    #10
    A=1;S1=1;S2=1;
    #10
    $finish;
  end
endmodule