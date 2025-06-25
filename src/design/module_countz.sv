module module_countz#( N = 8 )(
    input logic clk,
    input logic rst,
    input logic step,
    output logic z 
);


always_ff @(posedge clk) begin
    if (rst) begin
        counter <= '0;
        z <= '0;
    end
    else if (step) begin
        counter <= counter - 1'b1;
        z <= '0; 
    end
    else begin
        counter <= counter;
    end
end
assign z = (counter == 0) ? 1'b1 : 1'b0;
endmodule