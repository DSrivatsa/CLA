`timescale 1ns/1ps

module dff_tb;
    reg d_in, clk, rst;
    wire q_out;

    dff u1 (d_in, clk, rst, q_out);

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("dff_async_tb.vcd");
        $dumpvars(0, dff_tb);

        rst = 1; #10;
        rst = 0; #10;
        d_in = 1; #10;
        d_in = 0; #10;
        d_in = 1; #10;
        d_in = 0; #10;
        d_in = 1; #10;
        d_in = 0; #10;

        $finish;
    end
endmodule
