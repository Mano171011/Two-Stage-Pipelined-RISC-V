`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.11.2026 21:34:20
// Design Name: 
// Module Name: if_ex_register
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


module if_ex_register(input logic clk,
                      input logic reset,
                      input logic [31:0] if_instruction,
                      input logic [31:0] if_pc,
                      output logic [31:0] ex_instruction,
                      output logic [31:0] ex_pc);
 always_ff @(posedge clk or posedge reset)
 begin
 if(reset)
  begin
  ex_instruction <= 32'b0;
  ex_pc <= 32'b0;
 end
 else
 begin 
  ex_instruction <= if_instruction;
  ex_pc <= if_pc;
  end
 end                    
endmodule
