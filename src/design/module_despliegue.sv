module module_despliegue(
    input logic clk,rst,
    input logic [3:0] a_bin, b_bin,
    input logic [7:0] mult_bin,
    input logic [2:0] sel, // para test nada más. Aquí irían las señales de control de fsmload
    output logic [6:0] catodo,
    output logic [2:0] anodo
);
logic [7:0] mux_dato_p;
logic [3:0] dec, uni;
// Instanciación de módulos necesarios
module_mux_seleccionador mux_dato_prev(
    .a_bin(a_bin),
    .b_bin(b_bin),
    .mult_bin(mult_bin),
    .sel(sel),
    .out(mux_dato_p)
)

module_decobinabcd deco_binabcd(
    .b(mux_dato_p)
    .dec(dec),
    .uni(uni) 
)

module_shift_reg_op uni_dec(
    .clk(clk),
    .rst(rst),
    .load_a(),
    .load_b(),
    .num(mux_dato_p),
    .a(catodo),
    .b(anodo) 
)



endmodule 