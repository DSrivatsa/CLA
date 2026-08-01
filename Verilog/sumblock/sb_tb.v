`timescale 1ns/1ps

module tb_sum_block;
    reg A, B, C;
    wire P_inv, G_inv, S;
    
    sum_block dut(
        .A(A),
        .B(B),
        .C(C),
        .P_inv(P_inv),
        .G_inv(G_inv),
        .S(S)
    );
    
    initial begin
        $dumpfile("sum_block.vcd");
        $dumpvars(0, tb_sum_block);
        
        A = 0; B = 0; C = 0;
        #10;
        $display("A=%b, B=%b, C=%b | P_inv=%b, G_inv=%b, S=%b", A, B, C, P_inv, G_inv,S);
        
        A = 0; B = 0; C = 1;
        #10;
        $display("A=%b, B=%b, C=%b | P_inv=%b, G_inv=%b, S=%b", A, B, C, P_inv, G_inv,S);
        
        A = 0; B = 1; C = 0;
        #10;
        $display("A=%b, B=%b, C=%b | P_inv=%b, G_inv=%b, S=%b", A, B, C, P_inv, G_inv,S);
        
        A = 0; B = 1; C = 1;
        #10;
        $display("A=%b, B=%b, C=%b | P_inv=%b, G_inv=%b, S=%b", A, B, C, P_inv, G_inv,S);
        
        A = 1; B = 0; C = 0;
        #10;
        $display("A=%b, B=%b, C=%b | P_inv=%b, G_inv=%b, S=%b", A, B, C, P_inv, G_inv,S);
        
        A = 1; B = 0; C = 1;
        #10;
        $display("A=%b, B=%b, C=%b | P_inv=%b, G_inv=%b, S=%b", A, B, C, P_inv, G_inv,S);
        
        A = 1; B = 1; C = 0;
        #10;
        $display("A=%b, B=%b, C=%b | P_inv=%b, G_inv=%b, S=%b", A, B, C, P_inv, G_inv,S);
        
        A = 1; B = 1; C = 1;
        #10;
        $display("A=%b, B=%b, C=%b | P_inv=%b, G_inv=%b, S=%b", A, B, C, P_inv, G_inv,S);
        
        #10;
        $finish;
    end
    
endmodule
