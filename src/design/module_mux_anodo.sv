module module_mux_anodo(
    input logic [3:0] uni,
    input logic [3:0] dec,
    input logic load_u,
    input logic load_d,
    output logic [1:0] anodo
);
always_comb begin
    if (load_u) begin
        anodo = 2'b01; // Selecciona el dígito de las unidades
    end
    else if (load_d) begin
        anodo = 2'b10; // Selecciona el dígito de las decenas
    end 
    else begin
        anodo = 2'b00; // Ningún dígito seleccionado
    end
end
endmodule