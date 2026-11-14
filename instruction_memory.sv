`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.11.2026 21:09:44
// Design Name: 
// Module Name: instruction_memory
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



module instruction_memory(
    input  logic [31:0] address,
    output logic [31:0] instruction
);

logic [31:0] memory [0:4];

initial begin
    memory[0] = 32'h00A00093; // ADDI x1, x0, 10
    memory[1] = 32'h01400113; // ADDI x2, x0, 20
    memory[2] = 32'h002081B3; // ADD  x3, x1, x2
    memory[3] = 32'h40208233; // SUB  x4, x1, x2
    memory[4] = 32'h0020F2B3; // AND  x5, x1, x2
end

always_comb begin
    if (address >= 32'h80000000 &&
        address <= 32'h80000010 &&
        address[1:0] == 2'b00)
        instruction = memory[(address - 32'h80000000) >> 2];
    else
        instruction = 32'h00000013; // NOP
end

endmodule

