module module_mux_catodo(
    input logic [3:0] uni,
    input logic [3:0] dec,
    input logic load_u,
    input logic load_d,
    output logic [3:0] salida
);

always_comb begin
    if (load_u) begin
        salida = uni;
    end else if (load_d) begin
        salida = dec;
    end else begin
        salida = 4'b0000; // Ninguna entrada seleccionada
    end
end

endmodule