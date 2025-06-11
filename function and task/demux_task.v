module fun_demux(input I, input S1, input S2, input S3, input S4, output [15:0] O);
  reg [15:0] temp;
  
  task demux;
    input E, D1, D2, D3, D4;
    output [15:0] out;
    begin
      out[0] = ~D1 & ~D2 & ~D3 & ~D4 & E;
      out[1] = ~D1 & ~D2 & ~D3 & D4 & E;
      out[2] = ~D1 & ~D2 & D3 & ~D4 & E;
      out[3] = ~D1 & ~D2 & D3 & D4 & E;
      out[4] = ~D1 & D2 & ~D3 & ~D4 & E;
      out[5] = ~D1 & D2 & ~D3 & D4 & E;
      out[6] = ~D1 & D2 & D3 & ~D4 & E;
      out[7] = ~D1 & D2 & D3 & D4 & E;
      out[8] = D1 & ~D2 & ~D3 & ~D4 & E;
      out[9] = D1 & ~D2 & ~D3 & D4 & E;
      out[10] = D1 & ~D2 & D3 & ~D4 & E;
      out[11] = D1 & ~D2 & D3 & D4 & E;
      out[12] = D1 & D2 & ~D3 & ~D4 & E;
      out[13] = D1 & D2 & ~D3 & D4 & E;
      out[14] = D1 & D2 & D3 & ~D4 & E;
      out[15] = D1 & D2 & D3 & D4 & E;
    end
  endtask

  always @(*) begin
    demux(I, S1, S2, S3, S4, temp);
  end

  assign O = temp;
endmodule
