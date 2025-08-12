module ha(input A, input B, output C, output S);
  xor(S, A, B);
  and(C, A, B);
endmodule

module fa(input A, input B, input C_in, output C, output SUM);
  wire S1, C1, C2;

  ha h1(A, B, C1, S1);        
  ha h2(S1, C_in, C2, SUM);    
  or(C, C1, C2);               
endmodule

(* dont_touch = "true" *)
module multiplier2(input [15:0] a, input [15:0] b,input clk, output reg [31:0] z);
  wire [15:0] p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16;
  reg [15:0] c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15;
  reg [15:0] s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15;
  

  genvar i, j;
  generate
    for (i = 0; i < 16; i = i + 1) begin: pp_gen
      for (j = 0; j < 16; j = j + 1) begin: and_gen
        if (i == 0) assign p1[j] = a[0] & b[j];
        else if (i == 1) assign p2[j] = a[1] & b[j];
        else if (i == 2) assign p3[j] = a[2] & b[j];
        else if (i == 3) assign p4[j] = a[3] & b[j];
        else if (i == 4) assign p5[j] = a[4] & b[j];
        else if (i == 5) assign p6[j] = a[5] & b[j];
        else if (i == 6) assign p7[j] = a[6] & b[j];
        else if (i == 7) assign p8[j] = a[7] & b[j];
        else if (i == 8) assign p9[j] = a[8] & b[j];
        else if (i == 9) assign p10[j] = a[9] & b[j];
        else if (i == 10) assign p11[j] = a[10] & b[j];
        else if (i == 11) assign p12[j] = a[11] & b[j];
        else if (i == 12) assign p13[j] = a[12] & b[j];
        else if (i == 13) assign p14[j] = a[13] & b[j];
        else if (i == 14) assign p15[j] = a[14] & b[j];
        else if (i == 15) assign p16[j] = a[15] & b[j];
      end
    end
  endgenerate
  
  // First stage of addition
  wire [15:0] c1_wire,s1_wire;
  assign z[0] = p1[0];
  ha h1(p1[1], p2[0], c1_wire[0], s1_wire[0]);
  
  genvar k;
  generate
    for (k = 1; k < 15; k = k + 1) begin: first_stage
      fa f(p1[k+1], p2[k], c1_wire[k-1], c1_wire[k], s1_wire[k]);
    end
  endgenerate
  
  ha h2(c1_wire[14], p2[15], c1_wire[15], s1_wire[15]);
  
  always @(posedge clk) begin
    c1 <= c1_wire;
    s1 <= s1_wire;
    z[1] <= s1_wire[0];
  end
  
  
  
  // Second stage of addition
  wire [15:0] c2_wire , s2_wire;
  ha h3(s1[1], p3[0], c2_wire[0], s2_wire[0]);
  
  genvar m;
  generate
    for (m = 1; m < 16; m = m + 1) begin: second_stage
      if (m < 15) begin
        fa f2(s1[m+1], p3[m], c2_wire[m-1], c2_wire[m], s2_wire[m]);
      end else begin
        fa f2(c1[15], p3[15], c2_wire[m-1], c2_wire[m], s2_wire[m]);
      end
    end
  endgenerate
  
  always @(posedge clk) begin
  c2 <= c2_wire;
  s2 <= s2_wire;
  z[2] <= s2_wire[0];  // Pipelined stage-2 output
end
  
  // Continue this pattern for all 16 stages
  // Third stage
  wire [15:0] c3_wire , s3_wire;
  ha h4(s2[1], p4[0], c3_wire[0], s3_wire[0]);
  
  genvar n;
  generate
    for (n = 1; n < 16; n = n + 1) begin: third_stage
      if (n < 15) begin
        fa f3(s2[n+1], p4[n], c3_wire[n-1], c3_wire[n], s3_wire[n]);
      end else begin
        fa f3(c2[15], p4[15], c3_wire[n-1], c3_wire[n], s3_wire[n]);
      end
    end
  endgenerate
  
  always @(posedge clk) begin
   c3 <= c3_wire;
   s3 <= s3_wire;
   z[3] <= s3_wire[0];  // Pipelined stage-3 output
end
  

  
  // Fourth stage
  wire [15:0] s4_wire,c4_wire;
  ha h5(s3[1], p5[0], c4[0], s4[0]);
  
  genvar o;
  generate
    for (o = 1; o < 16; o = o + 1) begin: fourth_stage
      if (o < 15) begin
        fa f4(s3[o+1], p5[o], c4_wire[o-1], c4_wire[o], s4_wire[o]);
      end else begin
        fa f4(c3[15], p5[15], c4_wire[o-1], c4_wire[o], s4_wire[o]);
      end
    end
  endgenerate
  
    always @(posedge clk) begin
   c4 <= c4_wire;
   s4 <= s4_wire;
   z[4] <= s3_wire[0];  // Pipelined stage-3 output
end
  
  
  
  // Fifth stage
  wire [15:0] c5_wire,s5_wire;
  ha h6(s4[1], p6[0], c5_wire[0], s5_wire[0]);
  
  genvar p;
  generate
    for (p = 1; p < 16; p = p + 1) begin: fifth_stage
      if (p < 15) begin
        fa f5(s4[p+1], p6[p], c5_wire[p-1], c5_wire[p], s5_wire[p]);
      end else begin
        fa f5(c4[15], p6[15], c5_wire[p-1], c5_wire[p], s5_wire[p]);
      end
    end
  endgenerate
  
  always @(posedge clk) begin
   c5 <= c5_wire;
   s5 <= s5_wire;
   z[5] <= s5_wire[0];  // Pipelined stage-3 output
end
 
  
  // Sixth stage
  wire [15:0] c6_wire ,s6_wire;
  ha h7(s5[1], p7[0], c6_wire[0], s6_wire[0]);
  
  genvar q;
  generate
    for (q = 1; q < 16; q = q + 1) begin: sixth_stage
      if (q < 15) begin
        fa f6(s5[q+1], p7[q], c6_wire[q-1], c6_wire[q], s6_wire[q]);
      end else begin
        fa f6(c5[15], p7[15], c6_wire[q-1], c6_wire[q], s6_wire[q]);
      end
    end
  endgenerate
  
 always @(posedge clk) begin
   c6 <= c6_wire;
   s6 <= s6_wire;
   z[6] <= s6_wire[0];  // Pipelined stage-3 output
end
  
  
  
  // Seventh stage
  wire [15:0] s7_wire,c7_wire;
  ha h8(s6[1], p8[0], c7_wire[0], s7_wire[0]);
  
  genvar r;
  generate
    for (r = 1; r < 16; r = r + 1) begin: seventh_stage
      if (r < 15) begin
        fa f7(s6[r+1], p8[r], c7_wire[r-1], c7_wire[r], s7_wire[r]);
      end else begin
        fa f7(c6[15], p8[15], c7_wire[r-1], c7_wire[r], s7_wire[r]);
      end
    end
  endgenerate
  
 always @(posedge clk) begin
   c7 <= c7_wire;
   s7 <= s7_wire;
   z[7] <= s7_wire[0];  // Pipelined stage-3 output
end
  
  
  // Eighth stage
  wire [15:0] c8_wire,s8_wire;
  ha h9(s7[1], p9[0], c8_wire[0], s8_wire[0]);
  
  genvar s;
  generate
    for (s = 1; s < 16; s = s + 1) begin: eighth_stage
      if (s < 15) begin
        fa f8(s7[s+1], p9[s], c8_wire[s-1], c8_wire[s], s8_wire[s]);
      end else begin
        fa f8(c7[15], p9[15], c8_wire[s-1], c8_wire[s], s8_wire[s]);
      end
    end
  endgenerate
  
 always @(posedge clk) begin
   c8 <= c8_wire;
   s8 <= s8_wire;
   z[8] <= s8_wire[0];  // Pipelined stage-3 output
end
  
  
  
  // Ninth stage
  wire [15:0] c9_wire,s9_wire;
  ha h10(s8[1], p10[0], c9_wire[0], s9_wire[0]);
  
  genvar t;
  generate
    for (t = 1; t < 16; t = t + 1) begin: ninth_stage
      if (t < 15) begin
        fa f9(s8[t+1], p10[t], c9_wire[t-1], c9_wire[t], s9_wire[t]);
      end else begin
        fa f9(c8[15], p10[15], c9_wire[t-1], c9_wire[t], s9_wire[t]);
      end
    end
  endgenerate
  
  always @(posedge clk) begin
   c9 <= c9_wire;
   s9 <= s9_wire;
   z[9] <= s9_wire[0];  // Pipelined stage-3 output
end
  
  
  
  // Tenth stage
  wire [15:0] c10_wire,s10_wire;
  ha h11(s9[1], p11[0], c10_wire[0], s10_wire[0]);
  
  genvar u;
  generate
    for (u = 1; u < 16; u = u + 1) begin: tenth_stage
      if (u < 15) begin
        fa f10(s9[u+1], p11[u], c10_wire[u-1], c10_wire[u], s10_wire[u]);
      end else begin
        fa f10(c9[15], p11[15], c10_wire[u-1], c10_wire[u], s10_wire[u]);
      end
    end
  endgenerate
  
  always @(posedge clk) begin
    c10 <= c10_wire;
    s10 <= s10_wire;
    z[10] <= s10_wire[0];  // Pipelined stage-3 output
end
  
  // Eleventh stage
  wire [15:0] c11_wire,s11_wire;
  ha h12(s10[1], p12[0], c11_wire[0], s11_wire[0]);
  
  genvar v;
  generate
    for (v = 1; v < 16; v = v + 1) begin: eleventh_stage
      if (v < 15) begin
        fa f11(s10[v+1], p12[v], c11_wire[v-1], c11_wire[v], s11_wire[v]);
      end else begin
        fa f11(c10[15], p12[15], c11_wire[v-1], c11_wire[v], s11_wire[v]);
      end
    end
  endgenerate
  
  always @(posedge clk) begin
    c11 <= c11_wire;
    s11 <= s11_wire;
    z[11] <= s11_wire[0];  // Pipelined stage-3 output
end
    
  
  // Twelfth stage
  wire [15:0] c12_wire,s12_wire;
  ha h13(s11[1], p13[0], c12_wire[0], s12_wire[0]);
  
  genvar w;
  generate
    for (w = 1; w < 16; w = w + 1) begin: twelfth_stage
      if (w < 15) begin
        fa f12(s11[w+1], p13[w], c12_wire[w-1], c12_wire[w], s12_wire[w]);
      end else begin
        fa f12(c11[15], p13[15], c12_wire[w-1], c12_wire[w], s12_wire[w]);
      end
    end
  endgenerate
  
  always @(posedge clk) begin
    c12 <= c12_wire;
    s12 <= s12_wire;
    z[12] <= s12_wire[0];  // Pipelined stage-3 output
end
  
  // Thirteenth stage
  wire [15:0] c13_wire,s13_wire;
  ha h14(s12[1], p14[0], c13_wire[0], s13_wire[0]);
  
  genvar x;
  generate
    for (x = 1; x < 16; x = x + 1) begin: thirteenth_stage
      if (x < 15) begin
        fa f13(s12[x+1], p14[x], c13_wire[x-1], c13_wire[x], s13_wire[x]);
      end else begin
        fa f13(c12[15], p14[15], c13_wire[x-1], c13_wire[x], s13_wire[x]);
      end
    end
  endgenerate
  
  always @(posedge clk) begin
    c13 <= c13_wire;
    s13 <= s13_wire;
    z[13] <= s13_wire[0];  // Pipelined stage-3 output
end
  
  // Fourteenth stage
  wire [15:0] c14_wire,s14_wire;
  ha h15(s13[1], p15[0], c14_wire[0], s14_wire[0]);
  
  genvar y;
  generate
    for (y = 1; y < 16; y = y + 1) begin: fourteenth_stage
      if (y < 15) begin
        fa f14(s13[y+1], p15[y], c14_wire[y-1], c14_wire[y], s14_wire[y]);
      end else begin
        fa f14(c13[15], p15[15], c14_wire[y-1], c14_wire[y], s14_wire[y]);
      end
    end
  endgenerate
  
  always @(posedge clk) begin
    c14 <= c14_wire;
    s14 <= s14_wire;
    z[14] <= s14_wire[0];  // Pipelined stage-3 output
end
  
  // Fifteenth stage
  wire [15:0] c15_wire,s15_wire;
  ha h16(s14[1], p16[0], c15_wire[0], s15_wire[0]);
  
  genvar zz;
  generate
    for (zz = 1; zz < 16; zz = zz + 1) begin: fifteenth_stage
      if (zz < 15) begin
        fa f15(s14[zz+1], p16[zz], c15_wire[zz-1], c15_wire[zz], s15_wire[zz]);
      end else begin
        fa f15(c14[15], p16[15], c15_wire[zz-1], c15_wire[zz], s15_wire[zz]);
      end
    end
  endgenerate
  
  always @(posedge clk) begin
    c15 <= c14_wire;
    s15 <= s15_wire;
    z[15] <= s15_wire[0];  // Pipelined stage-3 output
    z[16] <= s15_wire[1];
    z[17] <= s15_wire[2];
    z[18] <= s15_wire[3];
    z[19] <= s15_wire[4];
    z[20] <= s15_wire[5];
    z[21] <= s15_wire[6];
    z[22] <= s15_wire[7];
    z[23] <= s15_wire[8];
    z[24] <= s15_wire[9];
    z[25] <= s15_wire[10];
    z[26] <= s15_wire[11];
    z[27] <= s15_wire[12];
    z[28] <= s15_wire[13];
    z[29] <= s15_wire[14];
    z[30] <= s15_wire[15];
    z[31] <= c15_wire[15];
end
endmodule