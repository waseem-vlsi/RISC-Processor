
module Reg_file_32_bit(
    input [4:0]rs_1,rs_2,write_address,     // source_registers,destination_register
    input write_enable,clk,                    //write_enable
    input [31:0]write_data,              //write data
    output [31:0]rout_1,rout_2   //output data of 32 bits
    );
    
reg [31:0] reg_file [31:0];
    
    initial 
    begin
        reg_file[0]  = 32'd15;
        reg_file[1]  = 32'd203;
        reg_file[2]  = 32'd1024;
        reg_file[3]  = 32'd77;
        reg_file[4]  = 32'd999;
        reg_file[5]  = 32'd4567;
        reg_file[6]  = 32'd321;
        reg_file[7]  = 32'd8888;
        reg_file[8]  = 32'd654;
        reg_file[9]  = 32'd4321;
        reg_file[10] = 32'd1111;
        reg_file[11] = 32'd2222;
        reg_file[12] = 32'd3333;
        reg_file[13] = 32'd4444;
        reg_file[14] = 32'd5555;
        reg_file[15] = 32'd6666;
        reg_file[16] = 32'd7777;
        reg_file[17] = 32'd888;
        reg_file[18] = 32'd9999;
        reg_file[19] = 32'd1234;
        reg_file[20] = 32'd2345;
        reg_file[21] = 32'd3456;
        reg_file[22] = 32'd456;
        reg_file[23] = 32'd5678;
        reg_file[24] = 32'd6789;
        reg_file[25] = 32'd7890;
        reg_file[26] = 32'd8901;
        reg_file[27] = 32'd9012;
        reg_file[28] = 32'd1357;
        reg_file[29] = 32'd2468;
        reg_file[30] = 32'd369;
        reg_file[31] = 32'd9876;
    end
    
    assign rout_1 = reg_file[rs_1];
    assign rout_2 = reg_file[rs_2];
       
       
always @(posedge clk)
    begin
        if (write_enable)
            reg_file[write_address] <= write_data;
        else 
           reg_file[write_address] <= 32'd0;
    end
              
endmodule
