`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2020 20:00:36
// Design Name: 
// Module Name: three_bits_adder
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


module three_bits_adder(input [2:0] A, B, input C0, output [2:0] S, output C3);

    wire C1,C2;
    
    one_bit_adder fa0(.A(A[0]), .B(~B[0]), .Cin(C0), .S(S[0]), .Cout(C1));
    one_bit_adder fa1(.A(A[1]), .B(~B[1]), .Cin(C1), .S(S[1]), .Cout(C2));
    one_bit_adder fa2(.A(A[2]), .B(~B[2]), .Cin(C2), .S(S[2]), .Cout(C3));
    
endmodule
