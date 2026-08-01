`timescale 1ns / 1ps

module top_tb;

    reg clk;
    reg [4:0] a_in;
    reg [4:0] b_in;

    wire [4:0] sum_out;
    wire cout_out;

    top uut(
        .clk(clk),
        .a_in(a_in),
        .b_in(b_in),
        .sum_out(sum_out),
        .cout_out(cout_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        a_in = 0;
        b_in = 0;
        #100;

        a_in = 5'd3; b_in = 5'd2;  #20;
        a_in = 5'd15; b_in = 5'd15; #20;
        a_in = 5'd31; b_in = 5'd1; #20;

        repeat (5) begin
            a_in = $random;
            b_in = $random;
            #20;
	    end
	    #100;
	    $finish;
 	end
endmodule