`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2020 18:30:23
// Design Name: 
// Module Name: alternating_blinking_led
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


module alternating_blinking_led(input CLOCK, switch, output LED);

    faster_blinking_led(CLOCK, fast_clock);
    slow_blinking_led(CLOCK, slow_clock);
    reg [31:0] COUNT = 0;
    assign LED = (switch == 1) ? fast_clock : slow_clock;


endmodule
