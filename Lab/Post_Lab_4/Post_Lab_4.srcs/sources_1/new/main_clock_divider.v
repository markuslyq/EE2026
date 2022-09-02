`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2020 19:24:58
// Design Name: 
// Module Name: main_clock_divider
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


module main_clock_divider(input CLOCK, output reg desired_clock = 0);
    reg [8:0] count = 0;
    
    always @ (posedge CLOCK)
    begin
        count <= count + 1;
        desired_clock <= (count == 0) ? ~desired_clock : desired_clock;
    end
endmodule
