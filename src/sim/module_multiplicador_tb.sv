`timescale 1us/1us

module module_multiplicador_tb;

  // Parámetros
  parameter N = 4;

  // Señales DUT
  logic clk, rst, init;
  logic [N-1:0] A, B;
  logic [2*N-1:0] Y;

  // Instancia del DUT
  module_multiplicador #(.N(N)) dut (
    .clk(clk),
    .rst(rst),
    .init(init),
    .a(A),
    .b(B),
    .p(Y)
  );

  // Generación del reloj
   initial clk = 0;
   always #1 clk = ~clk;
  // Inicialización
  initial begin
    rst = 1'b1;
    init = 1'b0;
    A = 'b0;
    B = 'b0;
    #2;
    rst = 1'b0;

    // Test de multiplicación
    A = 4'b0011; // 3
    B = 4'b0101; // 5
    init = 1'b1; // Iniciar multiplicación
    #10;
    init = 1'b0; // Terminar la señal de inicio

    // Esperar un tiempo para ver el resultado
    #100;

    // Verificar el resultado
    if (Y == (A * B)) begin
      $display("Multiplicación correcta: %b * %b = %b", A, B, Y);
    end else begin
      $display("Error en la multiplicación: %b * %b != %b", A, B, Y);
    end

    $finish;
  end

  initial begin
    $dumpfile("module_multiplicador_tb.vcd");
    $dumpvars(0, module_multiplicador_tb);
  end

endmodule