module module_dff(
    // Flip flop para guardar operandos de unidades y decenas antes de ser enviadas
    // al sistema de despliegue
    input logic clk,
    input logic rst,
    input logic [3:0] d,
    output logic [3:0] q
);
always_ff@(posedge clk)begin
    if (rst) begin
        q <= 4'0000;
    end
    else begin
        q <= d;
    end
end
endmodule