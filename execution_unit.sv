`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.11.2026 23:32:40
// Design Name: 
// Module Name: execution_unit
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



module execution_unit(
    input logic clk,
    input logic reset,
    input logic [31:0] instruction,
    output logic [31:0] alu_result
);

logic [6:0] opcode;
logic [4:0] rd, rs1, rs2;
logic [2:0] funct3;
logic [6:0] funct7;
logic [31:0] immediate;

logic [31:0] read_data1;
logic [31:0] read_data2;
logic [2:0] alu_control_signal;
logic [31:0] operand2;
logic alu_src;
logic reg_write;

// Instruction Decoder
instruction_decoder DECODER (
    .instruction(instruction),
    .opcode(opcode),
    .rd(rd),
    .rs1(rs1),
    .rs2(rs2),
    .funct3(funct3),
    .funct7(funct7),
    .immediate(immediate)
);

// Enable register write for R-type and ADDI
assign reg_write = (opcode == 7'b0110011) ||
                   (opcode == 7'b0010011);

// Register File
register_file REG_FILE (
    .clk(clk),
    .reset(reset),
    .reg_write(reg_write),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .write_data(alu_result),
    .read_data1(read_data1),
    .read_data2(read_data2)
);

// ALU Control
alu_control ALU_CTRL (
    .opcode(opcode),
    .funct3(funct3),
    .funct7(funct7),
    .alu_control(alu_control_signal)
);

// Select immediate for ADDI
assign alu_src = (opcode == 7'b0010011);

// ALU Input MUX
alu_input_mux MUX (
    .read_data2(read_data2),
    .immediate(immediate),
    .alu_src(alu_src),
    .operand2(operand2)
);

// ALU
alu ALU (
    .operand1(read_data1),
    .operand2(operand2),.alu_control(alu_control_signal),.alu_result(alu_result)
);
endmodule

