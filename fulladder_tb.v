// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
module fulladder_tb;
  reg a,b,c_in,c,s;
 
  
  fulladder uut(
    .a(a),
    .b(b),
    .c_in(c_in),
    .s(s),
    .c(c));
  
  initial begin
    $dumpfile("fulladder.vcd");
    $dumpvars(0,fulladder_tb);
    
    a = 0; b = 0; c_in = 0; #10;
    a = 0; b = 0; c_in = 1; #10;
    a = 0; b = 1; c_in = 0; #10;
    a = 0; b = 1; c_in = 1; #10;
    a = 1; b = 0; c_in = 0; #10;
    a = 1; b = 0; c_in = 1; #10;
    a = 1; b = 1; c_in = 0; #10;
    a = 1; b = 1; c_in = 1; #10;
    
    $finish;
  end
endmodule