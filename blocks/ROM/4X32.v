module Instruction_memory_2X32(
    input [1:0]address,
    output [31:0]out_data);
   
    
    reg [31:0]memory[3:0];
    
    initial 
    begin
    memory[0] = 32'd0;
    memory[1] = 32'd100;
    memory[2] = 32'd01;
    memory[3] = 32'd10;        
    end 
    
     assign out_data = memory[address]; 
    endmodule
    
