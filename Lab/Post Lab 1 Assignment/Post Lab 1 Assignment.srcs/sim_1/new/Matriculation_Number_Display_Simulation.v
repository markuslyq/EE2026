`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2020 19:05:43
// Design Name: 
// Module Name: Matriculation_Number_Display_Simulation
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


module Matriculation_Number_Display_Simulation(

    );
    
    reg SW0, SW1, SW2, SW3, SW4, SW5, SW6, SW7, SW8, SW9;
    wire AN0, AN1, AN2, AN3;
    
    Matriculation_Number_Display dut( SW0, SW1, SW2, SW3, SW4, SW5, SW6, SW7, SW8, SW9, AN0, AN1, AN2, AN3, seg0, seg1, seg2, seg3, seg4, seg5, seg6, segdp); //seg0, seg1, seg2, seg3, seg4, seg5, seg6, segdp
    
    initial begin
        SW0 = 0; SW1 = 1; SW2 = 1; SW3 = 0; SW4 = 0; SW5 = 0; SW6 = 1; SW7 = 1; SW8 = 0; SW9 = 0; #500; 
        SW0 = 1; SW1 = 1; SW2 = 1; SW3 = 0; SW4 = 0; SW5 = 0; SW6 = 1; SW7 = 1; SW8 = 0; SW9 = 0; #500; 
    end
    
    
endmodule
