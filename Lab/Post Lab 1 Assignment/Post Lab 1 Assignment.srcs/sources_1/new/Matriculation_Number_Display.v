`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2020 17:39:11
// Design Name: 
// Module Name: Matriculation_Number_Display
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


module Matriculation_Number_Display(input SW0, SW1, SW2, SW3, SW4, SW5, SW6, SW7, SW8, SW9, output AN0, AN1, AN2, AN3, seg0, seg1, seg2, seg3, seg4, seg5, seg6, segdp ); 
    assign seg0=0, seg1=1, seg2=0, seg3=1, seg4=0, seg5=1, seg6=1, segdp=1;
    assign AN3 = (SW0 | ~SW1 | ~SW2 | SW3 | SW4 | SW5 | ~SW6 | ~SW7 | SW8 | SW9);
    assign AN2 = (SW0 | ~SW1 | ~SW2 | SW3 | SW4 | SW5 | ~SW6 | ~SW7 | SW8 | SW9) |  SW1;
    //assign AN0 = ~((~SW0 & SW1 & SW2 & ~SW3 & ~SW4 & ~SW5 & SW6 & SW7 & ~SW8 & ~SW9)&SW1);
    //assign AN1 = ~((~SW0 & SW1 & SW2 & ~SW3 & ~SW4 & ~SW5 & SW6 & SW7 & ~SW8 & ~SW9)&SW0&SW1);
    assign AN1 = AN2, AN0 = AN2;
    
    
endmodule
