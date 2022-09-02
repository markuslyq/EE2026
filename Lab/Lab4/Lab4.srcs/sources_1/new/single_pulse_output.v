`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2020 09:31:41
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


module single_pulse_output(input pSignal, CLOCK, output reg [7:0] led = 0);
    
    wire Q1;
    wire slow_clock;
    wire single_pulse_out;
    clock_divider new_clock(CLOCK, slow_clock);
    my_dff ff1(slow_clock, pSignal, Q1);
    my_dff ff2(slow_clock, Q1, Q2);
    assign single_pulse_output = Q1 & ~Q2;
    
    always @ (posedge slow_clock)
    begin
        if (single_pulse_output == 1)
            led <= led + 1;
    end 
    
    
endmodule
