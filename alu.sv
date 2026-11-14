`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.11.2026 23:06:49
// Design Name: 
// Module Name: alu
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


module alu(input logic[31:0] operand1,input logic[31:0] operand2,input logic [2:0] alu_control,
           output logic [31:0] alu_result);
always_comb begin
case(alu_control)
  3'b000: alu_result = operand1 + operand2;
  3'b001: alu_result = operand1 - operand2;
  3'b010: alu_result = operand1 & operand2;
  3'b011: alu_result = operand1 | operand2;
  3'b100: alu_result = operand1 ^ operand2;
  default: alu_result = 32'b0;
  endcase
  end
endmodule
