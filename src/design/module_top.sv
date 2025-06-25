module module_top(input logic clk,
                  input logic rst,
                  input logic [3:0] fila,
                  output logic [7:0] mult); //corregir, ahora es una multipliación
    // Señales internas
    logic [3:0] numero,a,b;
    logic tecla, load_a, load_b, init;

    //Instancia del modulo del teclado
    module_teclado teclado(
        .clk(clk),
        .rst(rst),
        .fila(fila),
        .col(numero),
        .tecla(tecla)
    );

    //Instancia de la FSM de carga de numeros
    module_fsmop fsmop(
        .clk(clk),
        .rst(rst),
        .tecla(tecla),
        .load_a(load_a),
        .load_b(load_b),
        .load_m(init)
    );

    module_shift_reg_op shift_reg_op(
        .clk(clk),
        .rst(rst),
        .load_a(load_a),
        .load_b(load_b),
        .num(numero),
        .a(a),
        .b(b)
    );

    //Instancia del modulo de multiplicación
    
endmodule 