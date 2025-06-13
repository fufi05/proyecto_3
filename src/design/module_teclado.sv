module module_teclado(
    input logic clk,
    input logic rst,
    input logic [3:0] fila,
    output logic [3:0] col,
    output logic tecla
);
logic [1:0] count;
logic [3:0] out;
logic stop;
/*
// Instancia del divisor de frecuencia 
    module_count clk_div(
        .clk(clk),
        .rst(rst),
        .count_out(slow_clk)
    );
*/
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

endmodule