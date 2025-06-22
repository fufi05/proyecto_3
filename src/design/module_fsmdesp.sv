module module_fsmdesp(
    input logic clk, rst, count_en,
    output logic load_u, load_d
);
    parameter S0 = 2'b01;
    parameter S1 = 2'b10;
    logic [1:0] state, nextstate;
       // typedef enum logic [4:0] {IDLE,S0,S1,S2,S3} statetype; 
       // statetype state, nextstate;

 //state register
 always_ff @(posedge clk) begin
            if(rst) begin 
                state <= S0;
            end
            else begin
                state <= nextstate;
            end
        end
 //next state logic
 always_comb begin
    case(state)
    S0: if(count_en) nextstate = S1; // Si count_en es 1, pasa a S1
        else nextstate = S0; // Permanece en S0
    S1: if(count_en) nextstate = S0; // Si count_en es 1, vuelve a S0
        else nextstate = S1; // Permanece en S1
    default: nexstate = S0;
    endcase
 end
  // Output logic
    assign load_u = (state == S0);
    assign load_d = (state == S1);
endmodule