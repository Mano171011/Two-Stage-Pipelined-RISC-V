`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.11.2026 23:55:25
// Design Name: 
// Module Name: riscv_processor
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



module riscv_processor(
    input logic clk,
    input logic reset,
    input logic stall,

    output logic [31:0] current_pc,
    output logic [31:0] current_instruction,
    output logic [31:0] alu_result
);

instruction_fetch IF_STAGE (
    .clk(clk),
    .reset(reset),
    .stall(stall),
    .instruction_out(current_instruction),
    .pc_out(current_pc)
);

execution_unit EX_STAGE (
    .clk(clk),
    .reset(reset),
    .instruction(current_instruction),
    .alu_result(alu_result)
);

endmodule

