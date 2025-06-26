typedef struct packed {
    logic load_A;
    logic load_B;
    logic load_add;
    logic shift_HQ_LQ_Q_1;
    logic add_sub;
} control_t;

module module_fsmbooth(
    input logic clk, 
    input logic rst, 
    input logic init,
    input logic z,
    input logic [1:0] Q_LSB,
    output logic step,
    output logic done,
    output control_t control
    );
    parameter IDLE = 7'b0000001;
    parameter S0 = 7'b0000010;
    parameter S1 = 7'b0000100;
    parameter S2 = 7'b0001000;
    parameter S3 = 7'b0010000;
    parameter S4 = 7'b0100000;
    parameter S5 = 7'b1000000;
    logic [6:0] state, nextstate;

 //state register
 always_ff @(posedge clk) begin
            if(rst) begin 
                state <= IDLE;
            end
            else begin
                state <= nextstate;
            end
        end
 //next state logic
 always_comb begin
    case(state)
        IDLE: if(init) nextstate = S0;
        else nextstate = IDLE; // Espera a la señal de inicio
        S0: nextstate = S1; // Carga A y B, espera a Q_LSB
        S1: case(Q_LSB)
            2'b01: nextstate = S2; // Q_LSB = 01, suma
            2'b10: nextstate = S3; // Q_LSB = 10, resta
            2'b00: nextstate = S4; // Q_LSB = 00 o 11, no hace nada
            2'b11: nextstate = S4;
            default: nextstate = S1; // Estado no válido, reinicia
            endcase
        S2: nextstate = S4; // Suma, shift
        S3: nextstate = S4; // Resta, shift
        S4: nextstate = S5; 
        S5: if(z) nextstate = IDLE;
            else nextstate = S1; // Si z es 0, vuelve a S1
        default: nextstate = IDLE;
    endcase
 end
  // Output logic
    always_comb begin
        case (state)
            IDLE: begin
                control.load_A = '0;
                control.load_B = '0;
                control.load_add = '0;
                control.shift_HQ_LQ_Q_1 = '0;
                control.add_sub = 'x;
                done = '0;
                step = '0; // No se da un paso en el estado IDLE
            end
            S0: begin
                control.load_A = '1; // Carga A
                control.load_B = '1; // Carga B
                control.load_add = '1;
                control.shift_HQ_LQ_Q_1 = '0;
                control.add_sub = 'x;
                done = '0;
                step = '0;
            end
            S1: begin
                control.load_A = '0;
                control.load_B = '0;
                control.load_add = '0;
                control.shift_HQ_LQ_Q_1 = '0;
                control.add_sub = 'x;
                done = '0;
                step = '0; 
            end
            S2: begin
                control.load_A = '0;
                control.load_B = '0;
                control.load_add = '1;
                control.shift_HQ_LQ_Q_1 = '0;
                control.add_sub = '1; // Suma
                done = '0;
                step = '0; 
            end
            S3: begin
                control.load_A = '0;
                control.load_B = '0;
                control.load_add = '1; // Carga resta
                control.shift_HQ_LQ_Q_1 = '0;
                control.add_sub = '0; // Resta
                done = '0;
                step = '0;
            end
            S4: begin
                control.load_A = '0;
                control.load_B = '0;
                control.load_add = '0; // No carga nada, solo desplaza
                control.shift_HQ_LQ_Q_1 = '1; // Desplaza
                control.add_sub = 'x; // No suma ni resta en este paso
                done = '0;
                step = '1;
            end
            S5: begin
                control.load_A = '0;
                control.load_B = '0;
                control.load_add = '0; // No carga nada, espera a z para decidir el siguiente paso
                control.shift_HQ_LQ_Q_1 = '0; // No desplaza en este paso, espera a z
                control.add_sub = 'x; // No suma ni resta en este paso, espera a z para decidir el siguiente paso
                done = (z) ? '1 : '0;
                step = '0;
            end
        default: begin
                control.load_A = '0;
                control.load_B = '0;
                control.load_add = '0;
                control.shift_HQ_LQ_Q_1 = '0;
                control.add_sub = 'x;
                step = '0;
                done = '0;
            end
        endcase
    end
endmodule