module module_top (
    input logic clk,
    input logic rst,
    input logic [3:0] fila,
    output logic [6:0] m // prueba
   // output logic [1:0] anodo,
   // output logic [6:0] catodo
);
logic [3:0] a, b;
// logic [7:0] m;
logic load_a, load_b, rdy;

//Teclado
module_teclado teclado(
    .clk(clk),
    .rst(rst),
    .fila(fila),
    .a(a),
    .b(b),
    .load_a(load_a),
    .load_b(load_b),
    .rdy(rdy)
);
 //Multiplicador
module_multiplicador #(.N(4)) multiplicador (
    .clk(clk),
    .rst(rst),
    .init(rdy),
    .a(a),
    .b(b),
    .p(m)
);

//Despliegue
/*module_despliegue despliegue (
    .clk(clk),
    .rst(rst),
    .load_a(load_a),
    .load_b(load_b),
    .load_m(rdy),
    .a(a),
    .b(b),
    .m(m),
    .catodo(catodo),
    .anodo(anodo)
);*/ 

endmodule 
