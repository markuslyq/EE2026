`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2020 20:25:07
// Design Name: 
// Module Name: eight_bit_substractor
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


module eight_bit_substractor(input [7:0] A, B, input C0, output [7:0] S, output C8);

    wire C1,C2,C3,C4,C5,C6,C7;
    wire Cin;
    assign Cin = ~(C0^C0);

    five_bit_adder LEAST_SIGNIFICANT_BITS(.A(A[4:0]), .B(B[4:0]), .C0(Cin), .S(S[4:0]), .C5(C5));
    three_bits_adder MOST_SIGNIFICANT_BITS(.A(A[7:5]), .B(B[7:5]), .C0(C5), .S(S[7:5]), .C3(C8));


endmodule
