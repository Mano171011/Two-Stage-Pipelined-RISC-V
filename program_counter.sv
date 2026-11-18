`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.11.2026 21:00:38
// Design Name: 
// Module Name: program_counter
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


module program_counter(
    input logic clk,
    input logic reset,
    input logic stall,
    output logic [31:0] pc
);

always_ff @(posedge clk or posedge reset) begin
    if (reset)
        pc <= 32'h80000000;
    else if (!stall)
        pc <= pc + 4;
end

endmodule
