`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.11.2026 23:16:31
// Design Name: 
// Module Name: alu_control
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


module alu_control(input logic [6:0] opcode,input logic [2:0] funct3,input logic [6:0] funct7,
                   output logic [2:0] alu_control);
always_comb
begin
 alu_control = 3'b000;
 case(opcode)
 // R-type instructions
 7'b0110011: begin
 case (funct3)
  3'b000: begin
  if (funct7 == 7'b0100000)
  alu_control = 3'b001; // SUB
  else
  alu_control = 3'b000; // ADD
  end
  3'b111: alu_control = 3'b010; // AND
  3'b110: alu_control = 3'b011; // OR
  3'b100: alu_control = 3'b100; // XOR
  default: alu_control = 3'b000;
  endcase
end
   // I-type ADDI instruction
    7'b0010011: begin
     if (funct3 == 3'b000)
     alu_control = 3'b000; // ADD
     else
     alu_control = 3'b000;
      end
      default: alu_control = 3'b000;
    endcase
end
endmodule

