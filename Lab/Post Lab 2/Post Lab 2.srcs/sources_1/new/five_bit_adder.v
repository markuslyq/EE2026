`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2020 16:12:35
// Design Name: 
// Module Name: five_bit_adder
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


module five_bit_adder(input [4:0] A, B, input C0, output [4:0] S, output C5);

    wire C1,C2,C3,C4;
    
    one_bit_adder fa0(.A(A[0]), .B(~B[0]), .Cin(C0), .S(S[0]), .Cout(C1));
    one_bit_adder fa1(.A(A[1]), .B(~B[1]), .Cin(C1), .S(S[1]), .Cout(C2));
    one_bit_adder fa2(.A(A[2]), .B(~B[2]), .Cin(C2), .S(S[2]), .Cout(C3));
    one_bit_adder fa3(.A(A[3]), .B(~B[3]), .Cin(C3), .S(S[3]), .Cout(C4));
    one_bit_adder fa4(.A(A[4]), .B(~B[4]), .Cin(C4), .S(S[4]), .Cout(C5));

endmodule
