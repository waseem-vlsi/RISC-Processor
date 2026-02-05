
module ALU_tb();

parameter WIDTH = 8;

reg  [WIDTH-1:0] A, B;
reg              Alu_control;
reg  [1:0]       alu_control;
wire [WIDTH-1:0] result;
wire             Cout;

ALU #(.WIDTH(WIDTH)) dut (
    .A(A),
    .B(B),
    .Alu_control(Alu_control),
    .alu_control(alu_control),
    .result(result),
    .Cout(Cout)
);

initial begin
    A = 0; B = 0; Alu_control = 0; alu_control = 0;

    #10 A = 8'h05; B = 8'h03; Alu_control = 0; alu_control = 2'b00; // ADD
    #10 A = 8'h05; B = 8'h03; Alu_control = 1; alu_control = 2'b00; // ADD with ~A
    #10 A = 8'h0F; B = 8'h33; Alu_control = 0; alu_control = 2'b01; // AND
    #10 A = 8'h0F; B = 8'h33; Alu_control = 0; alu_control = 2'b10; // OR
    #10 A = 8'hAA; B = 8'h55; Alu_control = 0; alu_control = 2'b11; // ZERO EXTEND

    #10 $stop;
end

endmodule
