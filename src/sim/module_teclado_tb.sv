`timescale 1us/1us

module module_teclado_tb;

logic clk, rst, tecla, load_a, load_b, rdy;
logic [3:0] fila, a, b;

// Instancia del DUT
module_teclado dut (
    .clk(clk),
    .rst(rst),
    .fila(fila),
    .load_a(load_a),
    .load_b(load_b),
    .a(a),
    .b(b),
    .rdy(rdy)
);

// Generación de reloj de 1us de período (1MHz)
initial clk = 0;
always #1 clk = ~clk;

initial begin
    // Inicialización
    rst = 1'b1;
    fila = 4'b0000;
    #2;
    rst = 1'b0;
    #2;

    // Simulación del rebote en la fila[0]
    // Como si el usuario presionara una tecla, pero el contacto rebota

    // Rebote: fluctuación rápida antes de estabilizar en 0001
    fila = 4'b0000; #3;
    fila = 4'b0001; #2;
    fila = 4'b0000; #2;
    fila = 4'b0001; #1;
    fila = 4'b0000; #1;
    fila = 4'b0001; #10; // Se estabiliza en presionado

    // Mantener presionado por un tiempo
    #20;

    // Simular liberación con rebote inverso
    fila = 4'b0000; #2;
    fila = 4'b0001; #2;
    fila = 4'b0000; #2;
    fila = 4'b0001; #1;
    fila = 4'b0000; #10; // Se estabiliza en no presionado

    #30;
    $display("Fila final: %b, A: %b, B: %b, RDY: %b", fila, a, b, rdy);
    $finish;
end

initial begin
    $dumpfile("module_teclado_tb.vcd");
    $dumpvars(0, module_teclado_tb);
end

endmodule
