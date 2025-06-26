typedef struct packed {
    logic load_A;
    logic load_B;
    logic load_add;
    logic shift_HQ_LQ_Q_1;
    logic add_sub;
} control_m;

module module_multiplicador #(
    parameter N = 4
)(
    input logic clk,
    input logic rst,
    input logic init, // Señal para iniciar la multiplicación
    input logic [N-1:0] a,
    input logic [N-1:0] b,
    output logic [2*N-1:0] p // Producto de N bits
);

// Señales de control para la multiplicación
logic [1:0] Q_LSB; // LSB de Q
logic step,done,z;
control_m mult_control;

// Instancia de la FSM de Booth
module_fsmbooth fsmbooth (
    .clk(clk),
    .rst(rst),
    .init(init),
    .z(z),
    .Q_LSB(Q_LSB),
    .step(step),
    .done(done),
    .control(mult_control)
);

// Instancia del contador decremental
module_decount #(.N(N)) decremental (
    .clk(clk),
    .rst(rst),
    .step(step),
    .z(z)
);
// Control de la multiplicación
module_mult_booth #(.N(N)) multiplicador (
    .clk(clk),
    .rst(rst),
    .A(a),
    .B(b),
    .mult_control(mult_control),
    .Q_LSB(Q_LSB),
    .Y(p)
);

endmodule