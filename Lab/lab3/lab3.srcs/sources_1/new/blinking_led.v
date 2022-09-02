`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.09.2020 09:45:47
// Design Name: 
// Module Name: blinking_led
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


module slow_blinking_led(input CLOCK, output desired_clock);

    reg [25:0] COUNT = 0;
    reg desired = 0;
    
    always @ (posedge CLOCK) begin
        COUNT <= COUNT + 1;
        desired <= ( COUNT == 4'b0000 ) ? ~desired : desired;
    end
    
    assign desired_clock = desired;
    
endmodule
