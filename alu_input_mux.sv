`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.11.2026 23:26:57
// Design Name: 
// Module Name: alu_input_mux
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu_input_mux(input logic [31:0] read_data2,input logic [31:0] immediate ,input logic alu_src,
                     output logic [31:0] operand2);
always_comb
begin
if(alu_src == 1'b1)
operand2 = immediate;
else
operand2 = read_data2;
end
endmodule
