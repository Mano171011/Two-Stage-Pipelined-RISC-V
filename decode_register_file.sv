`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.11.2026 22:44:18
// Design Name: 
// Module Name: decode_register_file
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


module decode_register_file(input logic clk,input logic reset,
                            input logic reg_write,input logic [31:0] write_data,
                            input logic [31:0] instruction,
                            output logic [6:0] opcode,output logic [4:0] rd,output logic [2:0] funct3,output logic [6:0] funct7,output logic [31:0] immediate,
                            output logic [31:0] read_data1,output logic [31:0] read_data2);
 logic [4:0] rs1;
 logic [4:0] rs2;
 //Instruction decorder
 instruction_decoder DECODER(.instruction(instruction),.opcode(opcode),.rd(rd),.rs1(rs1),.rs2(rs2),
                               .funct3(funct3),.funct7(funct7),.immediate(immediate));
 //register file
 register_file REG_FILE(.clk(clk),.reset(reset),.reg_write(reg_write),.rs1(rs1),.rs2(rs2),.rd(rd),
                        .write_data(write_data),.read_data1(read_data1),.read_data2(read_data2));                                                  
endmodule
