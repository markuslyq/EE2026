`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2020 18:28:36
// Design Name: 
// Module Name: faster_blinking_led
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


module faster_blinking_led(input CLOCK, output desired_clock);

    reg [24:0] COUNT = 0;
    reg desired = 0;
    
    always @ (posedge CLOCK) begin
        COUNT <= COUNT + 1;
        desired <= ( COUNT == 4'b0000 ) ? ~desired : desired;
    end
    
    assign desired_clock = desired;
    
endmodule

