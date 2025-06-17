module carry_skip_adder_32bit(
  input  [31:0] a,
  input  [31:0] b,
  input         cin,
  output [31:0] sum,
  output        cout
);
  wire [31:0] p, g;
  wire [7:0] block_carry;
  wire [3:0] P0, P1, P2, P3;

  assign p = a ^ b;
  assign g = a & b;

  assign sum[0] = p[0] ^ cin;
  assign block_carry[0] = g[0] | (p[0] & cin);

  genvar i;
  generate
    for (i = 1; i < 32; i = i + 1) begin
      assign sum[i] = p[i] ^ block_carry[i-1];
      assign block_carry[i] = g[i] | (p[i] & block_carry[i-1]);
    end
  endgenerate

  assign P0 = &p[7:0];
  assign P1 = &p[15:8];
  assign P2 = &p[23:16];
  assign P3 = &p[31:24];

  wire [3:0] group_carry;
  assign group_carry[0] = block_carry[7] & P0 | ~P0 & block_carry[7];
  assign group_carry[1] = block_carry[15] & P1 | ~P1 & block_carry[15];
  assign group_carry[2] = block_carry[23] & P2 | ~P2 & block_carry[23];
  assign group_carry[3] = block_carry[31] & P3 | ~P3 & block_carry[31];

  assign cout = group_carry[3];
endmodule