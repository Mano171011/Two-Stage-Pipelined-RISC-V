`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.11.2026 22:28:10
// Design Name: 
// Module Name: register_file
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


module register_file(input logic clk,input logic reset,
                     input logic reg_write,input logic [4:0] rs1,
                     input logic [4:0] rs2,input logic[4:0] rd,
                     input logic [31:0] write_data,
                     output logic [31:0] read_data1,
                     output logic [31:0] read_data2);
logic [31:0] registers [0:31];
int i;
always_ff @(posedge clk or posedge reset)
begin
if (reset)
 begin
 for(i=0;i<32;i=i+1)
 registers[i] <= 32'b0;
 end
else if(reg_write && rd !=0)
 begin
 registers[rd] <= write_data;
 end 
end
always_comb begin
 read_data1 = (rs1==0) ? 32'b0 : registers[rs1];
 read_data2 = (rs2==0) ? 32'b0 : registers[rs2];
 end

endmodule
