`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.09.2020 10:41:51
// Design Name: 
// Module Name: two_bit_adder
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


module two_bit_adder(input [1:0] A, [1:0] B, C0, output [1:0] S, output C2);
    wire C1;
    
    one_bit_adder fa0(.A(A[0]), .B(B[0]), .Cin(C0), .S(S[0]), .Cout(C1));
    one_bit_adder fa1(.A(A[1]), .B(B[1]), .Cin(C1), .S(S[1]), .Cout(C2));

endmodule
