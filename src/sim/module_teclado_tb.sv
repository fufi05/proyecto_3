`timescale 1ns/1ns

module module_teclado_tb;

logic clk,rst,tecla;
logic [3:0] fila, col;

// Instancia del DUT
module_teclado dut (
    .clk(clk),
    .rst(rst),
    .fila(fila),
    .col(col),
    .tecla(tecla)
);

    initial clk = 0;
    always #1 clk = ~clk; // Generación del reloj

initial begin
    rst = 1'b0;
    #5;
    rst = 1'b1; // Activar el reset
    #5;
    fila = 4'b0001;
    #20;
    fila = 4'b0010; 
    #20;
    fila = 4'b0100; 
    #20;
    fila = 4'b1000; 
    #20;
    #50;
    $display("Fila presionada: %b, Columna salida: %b, Tecla: %b", fila, col, tecla);
    $finish; // Terminar la simulación
end
initial begin
    $dumpfile("module_teclado_tb.vcd");
    $dumpvars(0, module_teclado_tb);
end

endmodule