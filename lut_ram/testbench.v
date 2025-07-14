module testbench();
  parameter WIDTH = 32;
  parameter DEPTH = 16384;

  reg clk, rst, we;
  reg [$clog2(DEPTH)-1:0] addr;
  reg [WIDTH-1:0] din;
  wire [WIDTH-1:0] dout;

  lut_ram_1port #(.WIDTH(WIDTH), .DEPTH(DEPTH)) uut (
    .clk(clk),
    .rst(rst),
    .we(we),
    .addr(addr),
    .din(din),
    .dout(dout)
  );

  initial clk = 1;
  always #5 clk = ~clk;

  reg [$clog2(DEPTH)-1:0] prev_addr;
  reg prev_we;

  always @(posedge clk) begin
    if (!prev_we && !rst)
      $display("Time=%0t | READ: addr=%0d => dout=0x%h", $time, prev_addr, dout);
  end

  initial begin
    rst = 1;
    we = 0;
    addr = 0;
    din = 0;
    #10;
    rst=0;
  end

  initial begin
    $dumpfile("testbench.vcd");
    $dumpvars(0, testbench);
    addr = 5; din = 32'hAAAA_BBBB; we = 1; #10;
    addr = 6; din = 32'h1234_5678;          #10;
    addr = 15; din = 32'hDEAD_BEEF;         #10;

    we = 0; addr = 5; @(posedge clk);#10;
    addr = 6;         @(posedge clk);#10;
    addr = 15;        @(posedge clk);#10;

    #20;
    $finish;
  end
endmodule
