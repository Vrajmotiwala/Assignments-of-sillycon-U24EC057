module bcd_encoder(
  input I0, I1, I2, I3,   // Inputs representing decimal digits 0 to 3 (one-hot)
  output reg [1:0] Y,     // 2-bit binary output
  output reg valid        // Valid output flag
);
  always @(*) begin
    valid = 1'b0;
    Y = 2'b00;

    if (I0) begin
      Y = 2'b00;
      valid = 1'b1;
    end else if (I1) begin
      Y = 2'b01;
      valid = 1'b1;
    end else if (I2) begin
      Y = 2'b10;
      valid = 1'b1;
    end else if (I3) begin
      Y = 2'b11;
      valid = 1'b1;
    end
  end
endmodule