module dff(
    input d_in,
    input clk,
    input rst,
    output reg q_out);
    always @(posedge clk or posedge rst) begin
        if (rst)
            q_out <= 1'b0;
        else
            q_out <= d_in;
    end
endmodule
