module module_mux_seleccionador(
    input logic [3:0] a_bin,
    input logic [3:0] b_bin,
    input logic [7:0] mult_bin,
    input logic [2:0] sel,
    output logic [7:0] out 
);
 always_comb begin
    case(sel) //Cambiar selección por entradas de sel_a,sel_b y sel_mult
    3'b001: out = {4'b0000, a_bin}; // Selecciona A
    3'b010: out = {4'b0000, b_bin}; // Selecciona B
    3'b100: out = mult_bin;         // Selecciona Multiplicación 
    default : out = 8'b0000_0000; // Por defecto, salida en cero
    endcase
 end

endmodule