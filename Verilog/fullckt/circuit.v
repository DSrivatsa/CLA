module sum_block(A, B, C, P_inv, G_inv, S);
    input A, B, C;
    output P_inv, G_inv, S;
    wire midsum;   
    nor n1(P_inv, A, B);
    nand n2(G_inv, A, B);
    xor x1(midsum, A, B);
    xor x2(S, midsum, C);
endmodule

module d_ff (D, CLK, RST, Q);
  input D, CLK, RST;
  output reg Q;
  always @(posedge CLK or posedge RST) begin
    if (RST)
      Q = 1'b0;
    else
      Q = D;
  end
endmodule

module CLA(
    input a0, b0, a1, b1, a2, b2, a3, b3, a4, b4,
    input c0,      
    output s0, s1, s2, s3, s4,
    output c5     
);
    wire g0_inv, g1_inv, g2_inv, g3_inv, gen4_inv;
    wire p0_inv, p1_inv, p2_inv, p3_inv, prop4_inv;
    wire c1, c2, c3, c4, c4_inv;
    wire c0_inv;
    wire p1, p2, p3, p4, p5, p6, p7, p8;
    wire g1, g2, g3, g4, g5, g6, g7;
    wire p9, p10;
    wire midsum4;
    
    sum_block sb0(.A(a0), .B(b0), .C(c0), .P_inv(p0_inv), .G_inv(g0_inv), .S(s0));
    
    assign c0_inv = ~c0;
    assign p1 = p0_inv | c0_inv;
    assign c1 = ~(p1 & g0_inv);
    
    sum_block sb1(.A(a1), .B(b1), .C(c1), .P_inv(p1_inv), .G_inv(g1_inv), .S(s1));
    
    assign p2 = ~(p1_inv | p0_inv);
    assign g1 = p2 & c0;
    assign p3 = g0_inv | p1_inv;
    assign g2 = ~(p3 & g1_inv);
    assign c2 = g2 | g1;
    
    sum_block sb2(.A(a2), .B(b2), .C(c2), .P_inv(p2_inv), .G_inv(g2_inv), .S(s2));
    
    assign p4 = ~(p1_inv | p2_inv);
    assign g3 = p4 & c1;
    assign p5 = g1_inv | p2_inv;
    assign g4 = ~(p5 & g2_inv);
    assign c3 = g4 | g3;
    
    sum_block sb3(.A(a3), .B(b3), .C(c3), .P_inv(p3_inv), .G_inv(g3_inv), .S(s3));
    
    assign p6 = ~(p3_inv | p2_inv);
    assign p7 = p6 & p2;
    assign p8 = g2 & p6;
    assign g5 = g2_inv | p3_inv;
    assign g6 = ~(g5 & g3_inv);
    assign g7 = ~(g6 | p8);
    assign p9 = ~(p7 & c0);
    assign c4 = ~(p9 & g7);
    
    assign gen4_inv = ~(a4 & b4);
    assign prop4_inv = ~(a4 | b4);
    assign midsum4 = a4 ^ b4;
    assign s4 = midsum4 ^ c4;
    assign c4_inv = ~c4;
    assign p10 = prop4_inv | c4_inv;
    assign c5 = ~(p10 & gen4_inv);
    
endmodule

module cla5bit(
    input a0, b0, a1, b1, a2, b2, a3, b3, a4, b4,
    input c0,
    input clk,
    output s0, s1, s2, s3, s4,
    output c5
);
    wire a0_reg, b0_reg, a1_reg, b1_reg;
    wire a2_reg, b2_reg, a3_reg, b3_reg;
    wire a4_reg, b4_reg;
    wire c0_reg;
    wire s0_cla, s1_cla, s2_cla, s3_cla, s4_cla;
    wire c5_cla;
    
    d_ff ff_a0(.D(a0), .CLK(clk), .RST(1'b0), .Q(a0_reg));
    d_ff ff_b0(.D(b0), .CLK(clk), .RST(1'b0), .Q(b0_reg));
    d_ff ff_a1(.D(a1), .CLK(clk), .RST(1'b0), .Q(a1_reg));
    d_ff ff_b1(.D(b1), .CLK(clk), .RST(1'b0), .Q(b1_reg));
    d_ff ff_a2(.D(a2), .CLK(clk), .RST(1'b0), .Q(a2_reg));
    d_ff ff_b2(.D(b2), .CLK(clk), .RST(1'b0), .Q(b2_reg));
    d_ff ff_a3(.D(a3), .CLK(clk), .RST(1'b0), .Q(a3_reg));
    d_ff ff_b3(.D(b3), .CLK(clk), .RST(1'b0), .Q(b3_reg));
    d_ff ff_a4(.D(a4), .CLK(clk), .RST(1'b0), .Q(a4_reg));
    d_ff ff_b4(.D(b4), .CLK(clk), .RST(1'b0), .Q(b4_reg));
    d_ff ff_c0(.D(c0), .CLK(clk), .RST(1'b0), .Q(c0_reg));
    
    CLA cla_inst(
        .a0(a0_reg), .b0(b0_reg),
        .a1(a1_reg), .b1(b1_reg),
        .a2(a2_reg), .b2(b2_reg),
        .a3(a3_reg), .b3(b3_reg),
        .a4(a4_reg), .b4(b4_reg),
        .c0(c0_reg),
        .s0(s0_cla), .s1(s1_cla),
        .s2(s2_cla), .s3(s3_cla),
        .s4(s4_cla),
        .c5(c5_cla)
    );
    
    d_ff ff_s0(.D(s0_cla), .CLK(clk), .RST(1'b0), .Q(s0));
    d_ff ff_s1(.D(s1_cla), .CLK(clk), .RST(1'b0), .Q(s1));
    d_ff ff_s2(.D(s2_cla), .CLK(clk), .RST(1'b0), .Q(s2));
    d_ff ff_s3(.D(s3_cla), .CLK(clk), .RST(1'b0), .Q(s3));
    d_ff ff_s4(.D(s4_cla), .CLK(clk), .RST(1'b0), .Q(s4));
    d_ff ff_c5(.D(c5_cla), .CLK(clk), .RST(1'b0), .Q(c5));
    
endmodule
