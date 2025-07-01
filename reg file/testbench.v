module testbench();
  reg clk,en;
  reg [15:0] wd;
  reg [3:0] ra1,ra2,wa;
  wire [15:0] rd1,rd2;
  
  
  register_file uut(.clk(clk),
                    .en(en),
                    .wd(wd),
                    .wa(wa),
                    .ra1(ra1),
                    .ra2(ra2),
                    .rd1(rd1),
                    .rd2(rd2));
 initial clk = 0;
always #5 clk = ~clk;
  
  initial begin
  clk = 0;
  en = 0;
  wd = 16'd0;
  wa = 4'd0;
  ra1 = 4'd0;
  ra2 = 4'd0;
end
  
  initial begin 
    $dumpfile("testbench.vcd");
    $dumpvars(0,testbench);
    en=0;
    #5;
    en=1;wd=16'd23;wa=4'd3;
    #10;
    en=0;ra1=4'd3;
    #10;
    en=1;wd=16'd53;wa=4'd5;
    #10;
    en=0;ra2=4'd5;
    #10;
    $finish;
  end
endmodule