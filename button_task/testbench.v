// Code your testbench here
// or browse Examples
module testbench();
  reg button,CLK;
  wire pulse;
  integer i;
  
  taskb dut(.button(button),
           .CLK(CLK),
           .pulse(pulse));
      initial begin
        for(i=0;i<7;i=i+1) begin
          CLK=0;
          #10;
          CLK=1;
          #10;
        end
      end
      initial begin
       $dumpfile("testbench.vcd");
       $dumpvars(0,testbench);
       button = 0;
       #30;
       button= 1;
       #20;
       button=0;
       #5;
       button=1;
       #40;
        button=0;
        #20;
       $finish;
     end
 endmodule