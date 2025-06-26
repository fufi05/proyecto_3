module module_teclado(
    input logic clk,
    input logic rst,
    input logic [3:0] fila,
    output logic [3:0] a,
    output logic [3:0] b,
    output logic load_a,
    output logic load_b,
    output logic rdy
);
logic [1:0] count;
logic [3:0] out;
logic [3:0] col;
logic stop, tecla;

    // Instancia del contador de 2 bits
    module_2bitcounter twobitcounter(
        .clk(clk),
        .stop(stop),
        .rst(rst),
        .count_o(count)
    );

    // Instancia del decodificador 2:4
    module_deco2a4 deco(
        .in(count),
        .out(out)
    );

    //instancia del debouncer
    module_debouncer debouncer(
        .btn(|fila),
        .clk(clk),
        .rst(rst),
        .tecla(tecla),
        .stop(stop)
    );

    // Decodificador teclado 4x4 -> hexadecimal
    module_deco_tecladohex deco_teclado(
        .fila(fila),
        .col(out),
        .num(col)
    );

    // Instancia del FSM para capturar numeros del teclado
    module_fsmop fsmop (
        .clk(clk),
        .rst(rst),
        .tecla(tecla),
        .load_a(load_a),
        .load_b(load_b),
        .load_m(rdy)
    );

    // Instancia del registro de desplazamiento
    // para almacenar los valores de las columnas
    module_shift_reg_op shift_reg_op (
        .clk(clk),
        .rst(rst),
        .load_a(load_a),
        .load_b(load_b),
        .num(col),
        .a(a),
        .b(b)
    );

endmodule