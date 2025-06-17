// Code your testbench here
// or browse Examples
module cla_tb();
  reg [7:0] a,b;
  reg c_in;
  wire [7:0] sum;
  wire c_out;
  
  cla_8bit uut(.a(a),
               .b(b),
               .c_in(c_in),
               .sum(sum),
               .c_out(c_out));
  initial begin
    $dumpfile("cla_tb.vcd");
    $dumpvars(0,cla_tb);
    a=8'd12;b=8'd08;c_in=0;
    #10;
    a=8'd2;b=8'd08;c_in=0;
    #10;
    a=8'd2;b=8'd1;c_in=0;
    #10;
    a=8'd23;b=8'd18;c_in=1;
    #10;
    a=8'd02;b=8'd21;c_in=0;
    #10;
    a=8'd2;b=8'd08;c_in=1;
    #10;
    $finish;
  end
endmodule
    
    
    
  
  