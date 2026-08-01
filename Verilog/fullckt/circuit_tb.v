`timescale 1ns/1ps

module cla5bit_tb;
    reg a0, b0, a1, b1, a2, b2, a3, b3, a4, b4;
    reg c0;
    reg clk;
    wire s0, s1, s2, s3, s4;
    wire c5;
    
    reg [4:0] A, B;
    wire [4:0] sum_out;
    
    assign sum_out = {s4, s3, s2, s1, s0};
    
    cla5bit dut(
        .a0(a0), .b0(b0), .a1(a1), .b1(b1),
        .a2(a2), .b2(b2), .a3(a3), .b3(b3),
        .a4(a4), .b4(b4),
        .c0(c0),
        .clk(clk),
        .s0(s0), .s1(s1), .s2(s2), .s3(s3), .s4(s4),
        .c5(c5)
    );
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        $dumpfile("cla_5bit.vcd");
        $dumpvars(0, cla5bit_tb);        
        #10;
        
        A = 5'd15; B = 5'd10; c0 = 1'b0;
        {a4, a3, a2, a1, a0} = A;
        {b4, b3, b2, b1, b0} = B;
        @(posedge clk);
        #1;
        @(posedge clk);
        #2;
        $display("A=%d, B=%d, Cin=%d | Sum=%d, Cout=%d", A, B, c0, sum_out, c5);
        
        A = 5'd31; B = 5'd15; c0 = 1'b1;
        {a4, a3, a2, a1, a0} = A;
        {b4, b3, b2, b1, b0} = B;
        @(posedge clk);
        #1;
        @(posedge clk);
        #2;
        $display("A=%d, B=%d, Cin=%d | Sum=%d, Cout=%d", A, B, c0, sum_out, c5);
        
        A = 5'd7; B = 5'd8; c0 = 1'b1;
        {a4, a3, a2, a1, a0} = A;
        {b4, b3, b2, b1, b0} = B;
        @(posedge clk);
        #1;
        @(posedge clk);
        #2;
        $display("A=%d, B=%d, Cin=%d | Sum=%d, Cout=%d", A, B, c0, sum_out, c5);
        
        A = 5'd20; B = 5'd11; c0 = 1'b0;
        {a4, a3, a2, a1, a0} = A;
        {b4, b3, b2, b1, b0} = B;
        @(posedge clk);
        #1;
        @(posedge clk);
        #2;
        $display("A=%d, B=%d, Cin=%d | Sum=%d, Cout=%d", A, B, c0, sum_out, c5);
        
        A = 5'd0; B = 5'd0; c0 = 1'b1;
        {a4, a3, a2, a1, a0} = A;
        {b4, b3, b2, b1, b0} = B;
        @(posedge clk);
        #1;
        @(posedge clk);
        #2;
        $display("A=%d, B=%d, Cin=%d | Sum=%d, Cout=%d", A, B, c0, sum_out, c5);
        
        A = 5'd31; B = 5'd31; c0 = 1'b1;
        {a4, a3, a2, a1, a0} = A;
        {b4, b3, b2, b1, b0} = B;
        @(posedge clk);
        #1;
        @(posedge clk);
        #2;
        $display("A=%d, B=%d, Cin=%d | Sum=%d, Cout=%d", A, B, c0, sum_out, c5);
        
        #50;
        $finish;
    end
    
endmodule