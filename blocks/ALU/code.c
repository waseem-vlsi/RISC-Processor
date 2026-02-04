
module mux_2X1 #(
    parameter WIDTH = 8
)(
    input  [WIDTH-1:0] A, B,
    input              sel,
    output [WIDTH-1:0] out
);

assign out = sel ? B : A;

endmodule


// --------------------------------------8X1 MUX

module mux_8X1 #(
    parameter WIDTH = 8
)(
    input  [WIDTH-1:0] A, B, C, D, E,
    input  [2:0]       sel,
    output reg [WIDTH-1:0] out
);

always @(*) begin
    case (sel)
        3'b000: out = A;
        3'b001: out = B;
        3'b010: out = C;
        3'b011: out = D;
        3'b100: out = E;
        default: out = {WIDTH{1'b0}};
    endcase
end

endmodule


// ----------------------------------------ADDER BLOCK
module HA #(
parameter WIDTH = 8
)(
input [WIDTH-1:0]A,B,
output [WIDTH-1:0]sum,
output Cout);

assign sum = A^B;
assign Cout = (A&B);
endmodule 


// -----------------------NOT GATE ----------------------------//
module Not #(
parameter WIDTH = 8
)(
input [WIDTH-1:0]A,
output [WIDTH-1:0]Y);
assign Y = ~A;
endmodule


// ----------------------------------AND GATE--------------------------//
module And #(
parameter WIDTH = 8
)(
input [WIDTH-1:0]A,B,
output [WIDTH-1:0]Y);
assign Y = A&B;
endmodule


// -----------------------------OR GATE -------------------------------------//
module Or #(
parameter WIDTH = 8
)(
input [WIDTH-1:0]A,B,
output [WIDTH-1:0]Y);
assign Y = A|B;
endmodule

module zero_extend #(
    parameter N = 4,   
    parameter WIDTH = 8   
)(
    input [N-1:0]in,
    input sel,
    output reg [WIDTH-1:0]out
);
always @(*) begin
    if (sel)
        out = { {(WIDTH-N){1'b0}}, in };
    else
        out = {WIDTH{1'b0}};
end
endmodule

// -------------------------------MAIN ALU BLOCK************************//
module ALU #(
    parameter WIDTH = 8
)(
  input [WIDTH-1:0]A,B,
  input Alu_control,
  input [1:0]alu_control,
  output [WIDTH-1:0]result,
  output Cout);
  wire [WIDTH-1:0]Y,w0,w1,w2,w3,w4,w5;
  Not a0(.A(A), .Y(w0));
  mux_2X1 a1(.A(A), .B(w0), .sel(Alu_control), .out(w1));
  HA a2(.B(B), .A(w1), .sum(w2), .Cout(Cout));
  And a3(.A(A), .B(B), .Y(w3));
  Or a4(.A(A), .B(B), .Y(w4));
  zero_extend a5(.in(w2[WIDTH-1:WIDTH/2]), .out(w5), .sel(1'b1)); 
  mux_8X1 a6(.A(w2), .B(w2), .C(w3), .D(w4), .E(w5), .sel({Alu_control,alu_control}), .out(result));
endmodule
