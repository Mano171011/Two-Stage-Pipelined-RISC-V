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


module instruction_fetch(
    input logic clk,
    input logic reset,
    input logic stall,

    output logic [31:0] instruction_out,
    output logic [31:0] pc_out
);

logic [31:0] pc;
logic [31:0] instruction;

program_counter PC (
    .clk(clk),
    .reset(reset),
    .stall(stall),
    .pc(pc)
);

instruction_memory IMEM (
    .address(pc),
    .instruction(instruction)
);

if_ex_register IF_EX (
    .clk(clk),
    .reset(reset),
    .stall(stall),
    .if_instruction(instruction),
    .if_pc(pc),
    .ex_instruction(instruction_out),
    .ex_pc(pc_out)
);

endmodule
