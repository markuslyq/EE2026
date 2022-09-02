`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2020 15:26:24
// Design Name: 
// Module Name: one_bit_adder
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


module one_bit_adder(input A, B, Cin, output Cout, S);

    assign S = A ^ B ^ Cin;
    assign Cout = (A&B) | (Cin & (A^B));
    
endmodule
