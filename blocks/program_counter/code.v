module Program_counter(
    input [31:0]pc_next,
    input clk,
    output reg [31:0]pc
    );
    
    always@(posedge clk)
    begin
    pc <= pc_next;
    end
endmodule
