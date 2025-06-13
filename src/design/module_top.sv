module module_top(input logic clk,
                  input logic rst,
                  // input logic tecla,stop, // solo para este tb. Para el de verdad deben de ser señales internas
                  input logic [3:0] fila,
                  output logic [7:0] suma); //corregir, ahora es una multipliación
    // Señales internas
    logic tecla,stop,load_u, load_d, rdy, load_a, load_b,load_m,slow_clk;
    logic [1:0] count; 
    logic [7:0] a, b, bcd_out;
    logic [3:0] col_o, tecla_d, bcd_u, bcd_d;

    // Instancia del divisor de frecuencia 
    module_count clk_div(
        .clk(clk),
        .rst(rst),
        .count_out(slow_clk)
    );

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
        .out(col_o)
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
        .col(col_o),
        .num(tecla_d)
    );

    // Instancia de la FSM de carga
    module_fsmload fsm_load(
        .clk(clk),
        .rst(rst),
        .tecla(tecla),
        .load_u(load_u),
        .load_d(load_d),
        .load_out(rdy)
    );

    // Registro de desplazamiento para las unidades, decenas y centenas
    module_shift_reg_load shift1 (
        .clk(clk),
        .rst(rst),
        .load_u(load_u),
        .load_d(load_d),
        .rdy(rdy),
        .tecla_d(tecla_d),
        .uni(bcd_u),
        .dec(bcd_d),
        .out(bcd_out)
    );

    // Instancia de la FSM de operandos
    module_fsmop fsm_op(
        .clk(clk),
        .rst(rst),
        .rdy(rdy),
        .load_a(load_a),
        .load_b(load_b),
        .load_m(load_m));

    // Registro de desplazamiento para la FSM de operandos
    module_shift_reg_op shift2 (
        .clk(clk),
        .rst(rst),
        .load_a(load_a),
        .load_b(load_b),
        .num(bcd_out),
        .a(a),
        .b(b));

    // Instancia de la suma (cambiar por multiplicador)
    module_suma sumador(
        .a(a),
        .b(b),
        .s(suma)
    );

    // Instancia del sistema de despliegue 
    
endmodule 