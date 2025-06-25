module module_seleccionador(
    input logic [3:0] a_bin,
    input logic [3:0] b_bin,
    input logic [7:0] mult_bin,
    input logic load_a, load_b,load_m,
    output logic [7:0] out 
);
 always_comb begin
    out = load_A ? {4'b0000, a_bin} :
                load_B ? {4'b0000, b_bin} :
                load_m ? mult_bin : 8'b00000000;
 end
endmodule