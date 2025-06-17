// Code your testbench here
// or browse Examples
module rca_tb();
  reg [7:0] a,b;
  reg c_in;
  wire [7:0] sum;
  wire C_out;
  
  ripple_carry_adder uut(.a(a),
               .b(b),
               .c_in(c_in),
               .sum(sum),
                         .C_out(C_out));
  initial begin
    $dumpfile("rca_tb.vcd");
    $dumpvars(0,rca_tb);
    a=8'd12;b=8'd08;c_in=0;
    #10;
    a=8'd2;b=8'd08;c_in=0;
    #10;
    a=8'd22;b=8'd17;c_in=0;
    #10;
    a=8'd23;b=8'd10;c_in=1;
    #10;
    a=8'd602;b=8'd31;c_in=0;
    #10;
    a=8'd2;b=8'd08;c_in=1;
    #10;
    $finish;
  end
endmodule
    
    
    
  
  