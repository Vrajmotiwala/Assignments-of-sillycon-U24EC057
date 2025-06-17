// Code your testbench here
// or browse Examples
module comparator_tb();
  reg [3:0] a,b;
  wire s1,s2,s3;
  comparator uut(.a(a),
                 .b(b),
                 .s1(s1),
                 .s2(s2),
                 .s3(s3) 
                );
  initial begin
    $dumpfile("comparator_tb.vcd");
    $dumpvars(0,comparator_tb);
    a=4'd2;b=4'd2;
    #10;
     a=4'd3;b=4'd4;
    #10;
     a=4'd6;b=4'd5;
    #10;
    $finish;
  end
endmodule
    