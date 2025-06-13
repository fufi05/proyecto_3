module module_decobinabcd (
    input  logic [7:0] b,
    output logic [3:0] dec,
    output logic [3:0] uni
);
always_comb begin
    case (b)
        8'b00000000: begin dec = 4'b0000; uni = 4'b0000; end
        8'b00000001: begin dec = 4'b0000; uni = 4'b0001; end
        8'b00000010: begin dec = 4'b0000; uni = 4'b0010; end
        8'b00000011: begin dec = 4'b0000; uni = 4'b0011; end
        8'b00000100: begin dec = 4'b0000; uni = 4'b0100; end
        8'b00000101: begin dec = 4'b0000; uni = 4'b0101; end
        8'b00000110: begin dec = 4'b0000; uni = 4'b0110; end
        8'b00000111: begin dec = 4'b0000; uni = 4'b0111; end
        8'b00001000: begin dec = 4'b0000; uni = 4'b1000; end
        8'b00001001: begin dec = 4'b0000; uni = 4'b1001; end
        8'b00001010: begin dec = 4'b0001; uni = 4'b0000; end
        8'b00001011: begin dec = 4'b0001; uni = 4'b0001; end
        8'b00001100: begin dec = 4'b0001; uni = 4'b0010; end
        8'b00001101: begin dec = 4'b0001; uni = 4'b0011; end
        8'b00001110: begin dec = 4'b0001; uni = 4'b0100; end
        8'b00001111: begin dec = 4'b0001; uni = 4'b0101; end
        8'b00010000: begin dec = 4'b0001; uni = 4'b0110; end
        8'b00010001: begin dec = 4'b0001; uni = 4'b0111; end
        8'b00010010: begin dec = 4'b0001; uni = 4'b1000; end
        8'b00010011: begin dec = 4'b0001; uni = 4'b1001; end
        8'b00010100: begin dec = 4'b0010; uni = 4'b0000; end
        8'b00010101: begin dec = 4'b0010; uni = 4'b0001; end
        8'b00010110: begin dec = 4'b0010; uni = 4'b0010; end
        8'b00010111: begin dec = 4'b0010; uni = 4'b0011; end
        8'b00011000: begin dec = 4'b0010; uni = 4'b0100; end
        8'b00011001: begin dec = 4'b0010; uni = 4'b0101; end
        8'b00011010: begin dec = 4'b0010; uni = 4'b0110; end
        8'b00011011: begin dec = 4'b0010; uni = 4'b0111; end
        8'b00011100: begin dec = 4'b0010; uni = 4'b1000; end
        8'b00011101: begin dec = 4'b0010; uni = 4'b1001; end
        8'b00011110: begin dec = 4'b0011; uni = 4'b0000; end
        8'b00011111: begin dec = 4'b0011; uni = 4'b0001; end
        8'b00100000: begin dec = 4'b0011; uni = 4'b0010; end
        8'b00100001: begin dec = 4'b0011; uni = 4'b0011; end
        8'b00100010: begin dec = 4'b0011; uni = 4'b0100; end
        8'b00100011: begin dec = 4'b0011; uni = 4'b0101; end
        8'b00100100: begin dec = 4'b0011; uni = 4'b0110; end
        8'b00100101: begin dec = 4'b0011; uni = 4'b0111; end
        8'b00100110: begin dec = 4'b0011; uni = 4'b1000; end
        8'b00100111: begin dec = 4'b0011; uni = 4'b1001; end
        8'b00101000: begin dec = 4'b0100; uni = 4'b0000; end
        8'b00101001: begin dec = 4'b0100; uni = 4'b0001; end
        8'b00101010: begin dec = 4'b0100; uni = 4'b0010; end
        8'b00101011: begin dec = 4'b0100; uni = 4'b0011; end
        8'b00101100: begin dec = 4'b0100; uni = 4'b0100; end
        8'b00101101: begin dec = 4'b0100; uni = 4'b0101; end
        8'b00101110: begin dec = 4'b0100; uni = 4'b0110; end
        8'b00101111: begin dec = 4'b0100; uni = 4'b0111; end
        8'b00110000: begin dec = 4'b0100; uni = 4'b1000; end
        8'b00110001: begin dec = 4'b0100; uni = 4'b1001; end
        8'b00110010: begin dec = 4'b0101; uni = 4'b0000; end
        8'b00110011: begin dec = 4'b0101; uni = 4'b0001; end
        8'b00110100: begin dec = 4'b0101; uni = 4'b0010; end
        8'b00110101: begin dec = 4'b0101; uni = 4'b0011; end
        8'b00110110: begin dec = 4'b0101; uni = 4'b0100; end
        8'b00110111: begin dec = 4'b0101; uni = 4'b0101; end
        8'b00111000: begin dec = 4'b0101; uni = 4'b0110; end
        8'b00111001: begin dec = 4'b0101; uni = 4'b0111; end
        8'b00111010: begin dec = 4'b0101; uni = 4'b1000; end
        8'b00111011: begin dec = 4'b0101; uni = 4'b1001; end
        8'b00111100: begin dec = 4'b0110; uni = 4'b0000; end
        8'b00111101: begin dec = 4'b0110; uni = 4'b0001; end
        8'b00111110: begin dec = 4'b0110; uni = 4'b0010; end
        8'b00111111: begin dec = 4'b0110; uni = 4'b0011; end
        8'b01000000: begin dec = 4'b0110; uni = 4'b0100; end
        8'b01000001: begin dec = 4'b0110; uni = 4'b0101; end
        8'b01000010: begin dec = 4'b0110; uni = 4'b0110; end
        8'b01000011: begin dec = 4'b0110; uni = 4'b0111; end
        8'b01000100: begin dec = 4'b0110; uni = 4'b1000; end
        8'b01000101: begin dec = 4'b0110; uni = 4'b1001; end
        8'b01000110: begin dec = 4'b0111; uni = 4'b0000; end
        8'b01000111: begin dec = 4'b0111; uni = 4'b0001; end
        8'b01001000: begin dec = 4'b0111; uni = 4'b0010; end
        8'b01001001: begin dec = 4'b0111; uni = 4'b0011; end
        8'b01001010: begin dec = 4'b0111; uni = 4'b0100; end
        8'b01001011: begin dec = 4'b0111; uni = 4'b0101; end
        8'b01001100: begin dec = 4'b0111; uni = 4'b0110; end
        8'b01001101: begin dec = 4'b0111; uni = 4'b0111; end
        8'b01001110: begin dec = 4'b0111; uni = 4'b1000; end
        8'b01001111: begin dec = 4'b0111; uni = 4'b1001; end
        8'b01010000: begin dec = 4'b1000; uni = 4'b0000; end
        8'b01010001: begin dec = 4'b1000; uni = 4'b0001; end
        default:      begin dec = 4'b0000; uni = 4'b0000; end
    endcase
end

endmodule
