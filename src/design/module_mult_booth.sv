typedef struct packed {
    logic load_A;
    logic load_B;
    logic load_add;
    logic shift_HQ_LQ_Q_1;
    logic add_sub;
} mult_control_t;

module module_mult_booth#(
    parameter N = 8
)(
    input logic clk,
    input logic rst,
    input logic [N-1:0] A,
    input logic [N-1:0] B,
    input mult_control_t mult_control,
    output logic [1:0] Q_LSB, // [2] Q_LSB
    output logic [2*N-1:0] Y
);

    logic [N-1:0] M;
    logic [N-1:0] adder_sub_out;
    logic [2*N:0] shift;
    logic [N-1:0] HQ;
    logic [N-1:0] LQ;
    logic Q_1;

    // Registro de M
    always_ff @(posedge clk) begin
        if (rst)
            M <= 'b0;
        else 
            M <= (mult_control.load_A)? A : M;
    end

    // Suma o resta controlada
    always_comb begin
        if (mult_control.add_sub) begin
            adder_sub_out = HQ + M; // <- Error, debería ser HQ + M
        end
        else begin
            adder_sub_out = HQ - M; // <- Error, debería ser HQ - M
        end
    end
    //prueba
    // registros de desplazamiento
    always_comb begin
        Y = {HQ, LQ};
        HQ = shift[2*N:N+1];
        LQ = shift[N:1];
        Q_1 = shift[0];
        Q_LSB = {LQ[0], Q_1};
    end

    always_ff @(posedge clk) begin
        if (rst)
            shift <= 'b0;
        else if (mult_control.shift_HQ_LQ_Q_1)
        //Aritmetic right shift
            shift <= $signed(shift) >>> 1;
        else begin
            if (mult_control.load_B)
                shift[N:1] <= B; // LQ
            if (mult_control.load_add)
                shift[2*N:N+1] <= adder_sub_out; //HQ
        end
    end

endmodule
