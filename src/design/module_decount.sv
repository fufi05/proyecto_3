module module_decount #( 
    parameter N = 4
    )(
    input logic clk,
    input logic rst,
    input logic step,
    output logic z 
);

localparam width_counter = $clog2(N);
logic [width_counter:0] counter = N; // inicializar en N
logic z_flag = '0;

always_ff @(posedge clk) begin
    if (rst) begin
        counter <= N;
        z_flag <= '0;
    end
    else if (step) begin
        counter <= counter - 1'b1;
        z_flag <= '0; 
    end
    else if (counter == '0)begin
        counter <= '0;
        z_flag <= '1;
    end
    else begin
        counter <= counter;
        z_flag <= z_flag;
    end
end

assign z = z_flag;

endmodule