module module_despliegue(
    input logic clk,rst, load_a, load_b,load_m,
    input logic [3:0] a_bin, b_bin,
    input logic [7:0] mult_bin,
    output logic [6:0] catodo,
    output logic [1:0] anodo
);
logic [7:0] mux_dato_p;
logic [3:0] dec, uni,dec_o, uni_o;
// Instanciación de módulos necesarios
module_mux_seleccionador mux_dato_prev(
    .a_bin(a_bin),
    .b_bin(b_bin),
    .mult_bin(mult_bin),
    .load_a(load_a),
    .load_b(load_b),
    .load_m(load_m),
    .out(mux_dato_p)
);

module_decobinabcd deco_binabcd(
    .b(mux_dato_p)
    .dec(dec),
    .uni(uni) 
);

module_dff dff_uni(
    .clk(clk),
    .rst(rst),
    .d(uni),
    .q(uni_o)
);

module_dff dff_dec(
    .clk(clk),
    .rst(rst),
    .d(dec),
    .q(dec_o)
);



endmodule 