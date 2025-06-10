// Code your design here
module cla_8bit (
  input  [7:0] a,
  input  [7:0] b,
  input        c_in,
  output [7:0] sum,
  output       c_out
);
  wire c4;
s
  cla_4bit cla_low (
    .a(a[3:0]),
    .b(b[3:0]),
    .c_in(c_in),
    .sum(sum[3:0]),
    .c_out(c4)
  );

  cla_4bit cla_high (
    .a(a[7:4]),
    .b(b[7:4]),
    .c_in(c4),
    .sum(sum[7:4]),
    .c_out(c_out)
  );
endmodule
module cla_4bit (
  input  [3:0] a,
  input  [3:0] b,
  input        c_in,
  output [3:0] sum,
  output       c_out
);
  wire [3:0] p, g;   
  wire [3:0] c;       

  assign p = a ^ b;   
  assign g = a & b;    

  assign c[0] = c_in;
  assign c[1] = g[0] | (p[0] & c[0]);
  assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c[0]);
  assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c[0]);

  assign sum[0] = p[0] ^ c[0];
  assign sum[1] = p[1] ^ c[1];
  assign sum[2] = p[2] ^ c[2];
  assign sum[3] = p[3] ^ c[3];

  assign c_out = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1])
                | (p[3] & p[2] & p[1] & g[0])
                | (p[3] & p[2] & p[1] & p[0] & c[0]);
endmodule