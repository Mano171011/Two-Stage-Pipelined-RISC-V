`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.11.2026 21:57:36
// Design Name: 
// Module Name: instruction_decoder
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


module instruction_decoder(input logic [31:0] instruction,
output logic [6:0] opcode,
output logic [4:0] rd,
output logic [4:0] rs1,
output logic [4:0] rs2,
output logic [2:0] funct3,
output logic [6:0] funct7,
output logic [31:0] immediate);
assign opcode = instruction[6:0];
assign rd = instruction[11:7];
assign funct3 = instruction[14:12];
assign rs1 = instruction[19:15];
assign rs2 = instruction[24:20];
assign funct7 = instruction[31:25];
assign immediate = {{20{instruction[31]}},instruction[31:20]};
endmodule
