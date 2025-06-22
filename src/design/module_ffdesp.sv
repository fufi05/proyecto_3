module module_ffdesp(
    // Flip flop para guardar operandos de unidades y decenas antes de ser enviadas
    // al sistema de despliegue
    input logic clk,
    input logic rst,
    input logic [3:0] mux_datos_u,
    input logic [3:0] mux_datos_d,
    output logic [3:0] op_u,
    output logic [3:0] op_d
);
always_ff@(posedge clk)begin
    if (rst) begin
        op_u <= '0;
        op_d <= '0;
    end
    else begin
        op_u <= mux_datos_u;
        op_d <= mux_datos_d;
    end
end
endmodule