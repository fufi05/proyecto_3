module module_shift_reg_op(
    input logic clk,
    input logic rst,
    input logic load_a,
    input logic load_b,
    input logic [7:0] num,
    output logic [7:0] a,
    output logic [7:0] b
);

always_ff @(posedge clk)begin
        if (!rst)begin
            a <= '0;
            b <= '0;
        end
        else if (load_a) begin
                a <= num;
            end
        else if (load_b) begin
                b <= num;
            end
        else begin
                a <= a;
                b <= b; 
        end
        end
endmodule