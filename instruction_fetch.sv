`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.11.2026 21:44:52
// Design Name: 
// Module Name: instruction_fetch
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


module instruction_fetch(input logic clk ,input logic reset,
                         output logic [31:0] instruction_out,
                         output logic [31:0] pc_out);
//internal signal
logic [31:0] instruction;
logic [31:0] pc;
//program counter
program_counter PC (.clk(clk),.reset(reset),.pc(pc));
//instruction memory
instruction_memory IMEM(.address(pc),.instruction(instruction));
//if/ex pipeline register 
if_ex_register IF_EX(.clk(clk),.reset(reset),.if_instruction(instruction),.if_pc(pc),.ex_instruction(instruction_out),.ex_pc(pc_out));
endmodule
