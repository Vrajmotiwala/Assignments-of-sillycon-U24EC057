// Code your testbench here
// or browse Examples
module csa_tb();
  reg [31:0] a,b;
  reg c_in;
  wire [31:0] sum;
  wire c_out;
  
  carry_select_adder_32bit uut(.a(a),
               .b(b),
               .c_in(c_in),
               .sum(sum),
               .c_out(c_out));
  initial begin
    $dumpfile("csa_tb.vcd");
    $dumpvars(0,csa_tb);
    a=32'd12;b=32'd08;c_in=0;
    #10;
    a=32'd2;b=32'd08;c_in=0;
    #10;
    a=32'd22;b=32'd178;c_in=0;
    #10;
    a=32'd233;b=32'd108;c_in=1;
    #10;
    a=32'd602;b=32'd231;c_in=0;
    #10;
    a=32'd2;b=32'd08;c_in=1;
    #10;
    $finish;
  end
endmodule
    
    
    
  
  