 module module_shift_reg_load(
// Registro de desplazamiento para las unidades y decenas capturadas del teclado
    input logic clk,
    input logic rst,
    input logic load_u,
    input logic load_d,
    input logic rdy,
    input logic [3:0] tecla_d,
    output logic [3:0] uni,
    output logic [3:0] dec,
    output logic [7:0] out

 );
    always_ff @(posedge clk) begin
        if (!rst) begin
            uni <= '0;
            dec <= '0;
            out <= '0;
        end 
        else if (load_u) begin
                 uni <= tecla_d;
            end
        else if (load_d) begin
                 dec <= tecla_d;
            end
        else if (rdy) begin
                out <= {dec,uni};
            end
        else begin
            uni <= uni;
            dec <= dec;
            out <= out;
        end
    end
endmodule