`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2020 20:03:15
// Design Name: 
// Module Name: single_pulse_output
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


module single_pulse_output(input pSignal, CLOCK, output out);
    
    wire Q1, Q2;

    my_dff ff1(CLOCK, pSignal, Q1);
    my_dff ff2(CLOCK, Q1, Q2);
    assign out = Q1 & ~Q2;
    
endmodule
