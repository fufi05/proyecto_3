module module_decobinabcd_tb();

logic [7:0] b;
logic [3:0] dec, uni;

module_decobinabcd dut(.b(b), .dec(dec), .uni(uni));

initial begin
    b = 8'd45; #1;
    $display("BCD(45) = %d%d", dec, uni); // Esperado: 45

    b = 8'b00001010; #1;
    $display("BCD(10) = %d%d", dec, uni); // Esperado: 10

    b = 8'd81; #1;
    $display("BCD(81) = %d%d", dec, uni); // Esperado: 81

    b = 8'd5; #1;
    $display("BCD(5) = %d%d", dec, uni); // Esperado: 05

    b = 8'd99; #1;
    $display("BCD(99) = %d%d", dec, uni); // Fuera de rango, retorna 00
end

initial begin 
    $dumpfile("module_decobinabcd_tb.vcd");
    $dumpvars(0, module_decobinabcd_tb);
end
endmodule