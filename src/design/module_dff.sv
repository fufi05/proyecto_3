module module_dff#(parameter N = 4)(
    // Flip flop para guardar operandos de unidades y decenas antes de ser enviadas
    // al sistema de despliegue
    input logic clk,
    input logic rst,
    input logic [N-1:0] d,
    output logic [N-1:0] q
);
always_ff@(posedge clk)begin
    if (rst) begin
        q <= '0;
    end
    else begin
        q <= d;
    end
end
endmodule