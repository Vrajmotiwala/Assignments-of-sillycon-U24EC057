// Code your design here
module demux_1_to_N #(parameter N = 8)(
  input A,
  input [$clog2(N)-1:0] S, 
  output reg [N-1:0] Y     
);

  integer i;
  always @(*) begin
    Y = 0;  
    if (A) begin
      Y[S] = 1; 
    end
  end
endmodule