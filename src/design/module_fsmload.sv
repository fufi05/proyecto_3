 module module_fsmload(input logic clk,
                     input logic rst,
                     input logic tecla,
                     output logic load_u,
                     output logic load_d,
                     output logic load_out);

// FSM encargada de gestionar la carga de las unidades y decenas del número BCD

    parameter S0 = 4'b0001;
    parameter S1 = 4'b0010;
    parameter S2 = 4'b0100;
    parameter S3 = 4'b1000;
    logic [3:0] state, nextstate;

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
        S0: if(tecla) nextstate = S1;
        else nextstate = S0;
        S1: if(tecla) nextstate = S2;
        else nextstate = S1;
        S2: nextstate = S3;
        S3: nextstate = S0;
        default: nextstate = S0;
    endcase
 end
  // Output logic
    assign load_u = (state == S1);   // Señal activa durante S1
    assign load_d = (state == S2);   // Señal activa durante S2
    assign load_out = (state == S3);   // Procesamiento completo
 endmodule
 