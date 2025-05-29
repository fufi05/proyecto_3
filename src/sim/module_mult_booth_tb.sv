`timescale 1ns/1ps

typedef struct packed {
    logic load_A;
    logic load_B;
    logic load_add;
    logic shift_HQ_LQ_Q_1;
    logic add_sub;
} control_t;

module module_mult_booth_tb;

  // Parámetros
  parameter N = 8;

  // Señales DUT
  logic clk, rst;
  logic [N-1:0] A, B;
  control_t mult_control;
  logic [1:0] Q_LSB;
  logic [2*N-1:0] Y;

  // Instancia del DUT
  module_mult_booth #(.N(N)) dut (
    .clk(clk),
    .rst(rst),
    .A(A),
    .B(B),
    .mult_control(mult_control),
    .Q_LSB(Q_LSB),
    .Y(Y)
  );

  // Generación del reloj
   initial clk = 0;
   always #5 clk = ~clk;

  initial begin

    // Inicialización
    rst = 1'b1;
    #10;
    rst = 1'b0;
    #10;

    // Inicialización de señales
    A = 8'b00001011; // 11
    mult_control.load_A = 1'b1;
    #10;
   // mult_control.load_A = 1'bx;
   // #10;
    B = 8'b00001110; // 14
    mult_control.load_B = 1'b1;
    #10;
    mult_control.load_add = 1'b1; // Activar carga de suma
    #10;
    mult_control.load_add = 1'b0; // Desactivar carga de A
    #10;
// Iteraciones del algoritmo de Booth
    for (int i=0; i<N; i++)begin
      $display("Iteracion %0d: Q_LSB = %b", i, Q_LSB);
      if (Q_LSB == 2'b01) begin
        mult_control.add_sub = 1'b1; // Suma 
        #10;
        mult_control.load_add = 1'b1;
        #10;
        mult_control.shift_HQ_LQ_Q_1 = 1'b1;
        #10;
        mult_control.shift_HQ_LQ_Q_1 = 1'b0;
      end
      else if (Q_LSB == 2'b10) begin
        mult_control.add_sub = 1'b0; // Resta
        #10;
        mult_control.load_add = 1'b1; // activar carga de suma
        #10;
        mult_control.shift_HQ_LQ_Q_1 = 1'b1;
        #10;
        mult_control.shift_HQ_LQ_Q_1 = 1'b0;
      end
      else if (Q_LSB == 2'b00 || Q_LSB == 2'b11)begin
        mult_control.shift_HQ_LQ_Q_1 = 1'b1; // Desplazamiento
        #5;
        mult_control.shift_HQ_LQ_Q_1 = 1'b0;
      end
      else begin
        $display("Error: Q_LSB no es valido: %b", Q_LSB);
      end
    end

    #200;
    // Finalización de la simulación
    $display("Resultado final: Y = %b", Y);
    $finish;
  end

  initial begin
    $dumpfile("module_mult_booth_tb.vcd");
    $dumpvars(0, module_mult_booth_tb);
  end

endmodule