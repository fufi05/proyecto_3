`timescale 1ns/1ns
module module_mult_booth_tb;

    // Parameters
    parameter N = 8;

    // Inputs
    logic clk;
    logic rst;
    logic [N-1:0] A;
    logic [N-1:0] B;
    
    // Control signals
    logic load_A;
    logic load_B;
    logic load_add;
    logic shift_HQ_LQ_Q_1;
    logic add_sub;

    // Outputs
    logic [2:0] Q_LSB;
    logic [2*N-1:0] Y;

    // Instantiate the module under test
    module_mult_booth #(.N(N)) dut (
        .clk(clk),
        .rst(rst),
        .A(A),
        .B(B),
        .mult_control(mult_control_t),
        .Q_LSB(Q_LSB),
        .Y(Y)
    );

    // Clock generation
    initial begin
        clk = 0;
        always #5 clk = ~clk; // 10 ns clock period
    end

    // Testbench stimulus
    initial begin
        rst = 1; // Assert reset
        #10 rst = 0; // Deassert reset
        
        // Load values into A and B
        A = 8'b00001011; // Example value for A
        B = 8'b00001110; // Example value for B
        
        $finish; // End simulation
    end
    // Monitor outputs
    initial begin
        $monitor("Time: %0t, Q_LSB: %b, Y: %h", $time, Q_LSB, Y);
    end
    // Dump waveform for debugging
    initial begin
        $dumpfile("module_mult_booth_tb.vcd");
        $dumpvars(0, module_mult_booth_tb);
    end
endmodule 