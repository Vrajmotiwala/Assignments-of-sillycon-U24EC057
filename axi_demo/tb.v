// Code your testbench here
// or browse Examples
module demo_top_tb();
  reg clk,rst;
  reg [7:0] T_datain;
  wire [7:0] T_out;
  
  
  
  demo_top uut(
    .clk(clk),
    .rst(rst),
    .T_datain(T_datain),
    .T_out(T_out)
  );
  
  initial clk=0;
    always #5 clk=~clk;
  
  initial begin
    $dumpfile("demo_top_tb.vcd");
    $dumpvars(0,demo_top_tb);
    
    rst=0;
    T_datain=0;
    
    #20 rst=1;
    
    #20 T_datain=8'd7;
    #20 T_datain=8'd17;
    #20 T_datain=8'd12;
    #20 T_datain=8'd3;
    #20 T_datain=8'd1;
    
    #50;
    $finish;
  end
endmodule
    
    
    