`timescale 1ns / 1ps

module d_ff #(parameter WIDTH = 5)(
    input wire clk,
    input wire [WIDTH-1:0] d,
    output reg [WIDTH-1:0] q
);
    always @(posedge clk) begin
        q <= d;
    end
endmodule

module pg_gen(
    input wire [4:0] a,
    input wire [4:0] b,
    output wire [4:0] p,
    output wire [4:0] g
);
    assign p = a ^ b;
    assign g = a & b;
endmodule
module cla_unit(
    input wire cin,
    input wire [4:0] p,
    input wire [4:0] g,
    output wire [4:0] c
);

    assign c[0] = g[0] | (p[0] & cin);
    assign c[1] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);
    assign c[2] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin);
    assign c[3] = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) |
                  (p[3] & p[2] & p[1] & p[0] & cin);
   
    assign c[4] = g[4] | (p[4] & c[3]);   // cout
endmodule

module sum_gen(
    input wire [4:0] p,
    input wire [4:0] c_prev,
    output wire [4:0] sum
);
    assign sum = p ^ c_prev;
endmodule


module cla_5bit (
    input wire [4:0] a,
    input wire [4:0] b,
    input wire cin,
    output wire [4:0] sum,
    output wire cout
);

    wire [4:0] p, g;
    wire [4:0] c;

    pg_gen pg_inst(.a(a), .b(b), .p(p), .g(g));

    cla_unit cla_inst(.cin(cin), .p(p), .g(g), .c(c));

    sum_gen sum_inst(
        .p(p),
        .c_prev({c[3:0], cin}),
        .sum(sum)
    );

    assign cout = c[4];

endmodule

`timescale 1ns / 1ps

module top (
    input wire clk,
    input wire [4:0] a_in,
    input wire [4:0] b_in,
    output wire [4:0] sum_out,
    output wire cout_out
);

    wire [4:0] a_reg, b_reg;
    wire [4:0] sum_wire;
    wire cout_wire;

    wire cin_fixed = 1'b0;

    d_ff #(.WIDTH(5)) dff_a (
        .clk(clk), .d(a_in), .q(a_reg)
    );

    d_ff #(.WIDTH(5)) dff_b (
        .clk(clk), .d(b_in), .q(b_reg)
    );

    cla_5bit cla_core(
        .a(a_reg),
        .b(b_reg),
        .cin(cin_fixed),
        .sum(sum_wire),
        .cout(cout_wire)
    );

    d_ff #(.WIDTH(5)) dff_sum (
        .clk(clk), .d(sum_wire), .q(sum_out)
    );

    d_ff #(.WIDTH(1)) dff_cout (
        .clk(clk), .d(cout_wire), .q(cout_out)
    );

endmodule
