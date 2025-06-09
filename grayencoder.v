module gray_encoder(
  input [1:0] binary,
  output reg [1:0] gray
);
  always @(*) begin
    gray[1] = binary[1];                
    gray[0] = binary[1] ^ binary[0];  
  end
endmodule