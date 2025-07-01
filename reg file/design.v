module register_file(input clk,
                    input en,
                     input [3:0] ra1,
                     input [3:0] ra2,
                     input [3:0]  wa,
                     input [15:0] wd,
                     output [15:0] rd1,rd2);
  reg [15:0]  A [15:0];
  assign rd1 = A[ra1];
  assign rd2 = A[ra2];
  
  integer i;
initial begin
  for (i = 0; i < 16; i = i + 1)
    A[i] = 16'd0;
end
  
  always @(posedge clk) begin
    if(en) begin
      A[wa]=wd;
    end
  end
endmodule
  
