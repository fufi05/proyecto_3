 module module_shift_reg_load(
// Registro de desplazamiento para las unidades y decenas capturadas del teclado
    input logic clk,
    input logic rst,
    input logic load_u,
    input logic load_d,
    input logic rdy,
    input logic [3:0] tecla_d,
    output logic [3:0] bcd_u,
    output logic [3:0] bcd_d,
    output logic [7:0] bcd_out

 );
    always_ff @(posedge clk) begin
        if (!rst) begin
            bcd_u <= '0;
            bcd_d <= '0;
            bcd_out <= '0;
        end 
        else if (load_u) begin
                 bcd_u <= tecla_d;
            end
        else if (load_d) begin
                 bcd_d <= tecla_d;
            end
        else if (rdy) begin
                bcd_out <= {bcd_d,bcd_u};
            end
        else begin
            bcd_u <= bcd_u;
            bcd_d <= bcd_d;
            bcd_out <= bcd_out;
        end
    end
endmodule