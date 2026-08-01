module sum_block(A, B, C, P_inv, G_inv, S);
    input A, B, C;
    output P_inv, G_inv, S;
    wire midsum;   
    nor n1(P_inv, A, B);
    nand n2(G_inv, A, B);
    xor x1(midsum, A, B);
    xor x2(S, midsum, C);
endmodule