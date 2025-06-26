module module_despliegue(
    input logic clk,rst, load_a, load_b,load_m,
    input logic [3:0] a, b,
    input logic [7:0] m,
    output logic [6:0] catodo,
    output logic [1:0] anodo
);
logic count_out,load_u, load_d;
logic [6:0] catodo_mux_out;
logic [7:0] mux_dato_p;
logic [3:0] dec, uni,dec_o, uni_o;

// Instanciación de módulos necesarios
module_mux_seleccionador mux_dato_prev(
    .a_bin(a),
    .b_bin(b),
    .mult_bin(m),
    .load_a(load_a),
    .load_b(load_b),
    .load_m(load_m),
    .out(mux_dato_p)
);

module_decobinabcd deco_binabcd(
    .b(mux_dato_p),
    .dec(dec),
    .uni(uni) 
);

module_count #(.N(1000)) count(
    .clk(clk),
    .rst(rst),
    .count_out(count_out)
);
module_fsmdep fsmdesp (
    .clk(clk),
    .rst(rst),
    .count_en(count_out),
    .load_u(load_u),
    .load_d(load_d)
);

module_endff #(.N(4)) dff_uni(
    .clk(clk),
    .rst(rst),
    .en(load_u),
    .d(uni),
    .q(uni_o)
);

module_endff #(.N(4)) dff_dec(
    .clk(clk),
    .rst(rst),
    .en(load_d),
    .d(dec),
    .q(dec_o)
);

module_mux_anodo mux_anodo(
    .dec(dec_o),
    .uni(uni_o),
    .load_u(load_u),
    .load_d(load_d),
    .anodo(anodo)
);

module_catodo_mux catodo_mux(
    .dec(dec_o),
    .uni(uni_o),
    .load_u(load_u),
    .load_d(load_d),
    .salida(catodo_mux_out)
);

module_7segmentos seg7(
    .data(catodo_mux_out),
    .segmentos(catodo)
);
endmodule