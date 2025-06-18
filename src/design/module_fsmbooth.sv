module module_fsmbooth(
    input logic clk, rst, init, z,
    input logic [1:0] Q_LSB,
    output logic load_A, load_B, load_add, shift_HQ_LQ_Q_1, add_sub
);
    parameter S0 = 8'b00000001;
    parameter S1 = 8'b00000010;
    parameter S2 = 8'b00000100;
    parameter S3 = 8'b00001000;
    parameter S4 = 8'b00010000;
    parameter S5 = 8'b00100000;
    parameter S6 = 8'b01000000;
    parameter S7 = 8'b10000000;
    logic [7:0] state, nextstate;
       // typedef enum logic [4:0] {S0,S1,S2,S3,S4} statetype; 
       // statetype state, nextstate;

 //state register
 always_ff @(posedge clk) begin
            if(!rst) begin 
                state <= S0;
            end
            else begin
                state <= nextstate;
            end
        end
 //next state logic
 always_comb begin
    case(state)
        S0: if(init) nextstate = S1;
        else nextstate = S0; // Espera a la señal de inicio
        S1: nextstate = S2; // Carga A y B, espera a Q_LSB
        S2: case(Q_LSB)
            2'b01: nextstate = S3; // Q_LSB = 01, suma
            2'b10: nextstate = S4; // Q_LSB = 10, resta
            2'b00: nextstate = S5; // Q_LSB = 00 o 11, no hace nada
            2'b11: nextstate = S5;
            default: nextstate = S2; // Estado no válido, reinicia
            endcase
        S3: nextstate = S5; // Suma, shift
        S4: nextstate = S5; // Resta, shift
        S5: nextstate = S6; 
        S6: if(z) nextstate = S7;
            else nextstate = S2; // Si z es 0, vuelve a S2
        S7: nextstate = S0; // Procesamiento completo, vuelve a S0
        default: nextstate = S0;
    endcase
 end
  // Output logic
    assign load_u = (state == S1);   // Señal activa durante S1
    assign load_d = (state == S2);   // Señal activa durante S2
    assign load_c = (state == S3);   // Señal activa durante S3
    assign load_out = (state == S4);   // Procesamiento completo
endmodule