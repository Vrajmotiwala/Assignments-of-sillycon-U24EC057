// Code your design here
module carry_select_adder_32bit(
  input  [31:0] a,
  input  [31:0] b,
  input         c_in,
  output [31:0] sum,
  output        c_out
);
  wire [3:0] carry;

  // First 8-bit block (Ripple Carry Adder)
  ripple_carry_adder_8bit rca0 (
    .a(a[7:0]),
    .b(b[7:0]),
    .c_in(c_in),
    .sum(sum[7:0]),
    .c_out(carry[0])
  );

  // Carry Select Blocks
  carry_select_block cs1 (
    .a(a[15:8]),
    .b(b[15:8]),
    .c_in(carry[0]),
    .sum(sum[15:8]),
    .c_out(carry[1])
  );

  carry_select_block cs2 (
    .a(a[23:16]),
    .b(b[23:16]),
    .c_in(carry[1]),
    .sum(sum[23:16]),
    .c_out(carry[2])
  );

  carry_select_block cs3 (
    .a(a[31:24]),
    .b(b[31:24]),
    .c_in(carry[2]),
    .sum(sum[31:24]),
    .c_out(c_out)
  );
endmodule
module ripple_carry_adder_8bit(
  input  [7:0] a,
  input  [7:0] b,
  input        c_in,
  output [7:0] sum,
  output       c_out
);
  wire [6:0] c;

  full_adder fa0(a[0], b[0], c_in,    sum[0], c[0]);
  full_adder fa1(a[1], b[1], c[0],    sum[1], c[1]);
  full_adder fa2(a[2], b[2], c[1],    sum[2], c[2]);
  full_adder fa3(a[3], b[3], c[2],    sum[3], c[3]);
  full_adder fa4(a[4], b[4], c[3],    sum[4], c[4]);
  full_adder fa5(a[5], b[5], c[4],    sum[5], c[5]);
  full_adder fa6(a[6], b[6], c[5],    sum[6], c[6]);
  full_adder fa7(a[7], b[7], c[6],    sum[7], c_out);
endmodule
module carry_select_block(
  input  [7:0] a,
  input  [7:0] b,
  input        c_in,
  output [7:0] sum,
  output       c_out
);
  wire [7:0] sum0, sum1;
  wire c_out0, c_out1;

  ripple_carry_adder_8bit rca0 (
    .a(a), .b(b), .c_in(1'b0),
    .sum(sum0), .c_out(c_out0)
  );

  ripple_carry_adder_8bit rca1 (
    .a(a), .b(b), .c_in(1'b1),
    .sum(sum1), .c_out(c_out1)
  );

  assign sum   = (c_in) ? sum1 : sum0;
  assign c_out = (c_in) ? c_out1 : c_out0;
endmodule
module full_adder(
  input  a, b, c_in,
  output sum, c_out
);
  assign sum   = a ^ b ^ c_in;
  assign c_out = (a & b) | (b & c_in) | (a & c_in);
endmodule