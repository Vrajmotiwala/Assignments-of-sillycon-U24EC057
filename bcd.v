module bcd_encoder(
  input [3:0] Q,   
  output reg [7:0] Y           
);
  always @(*) begin
    if(Q < 10) begin
      Y = {4'b0000, Q};     
    end else begin
      Y = {4'b0001, Q - 4'd10}; 
    end
  end
endmodule