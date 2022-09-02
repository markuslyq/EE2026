`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.09.2020 19:56:52
// Design Name: 
// Module Name: sub_task_2_F_off
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


module sub_task_2_F_off(input CLOCK, output desired_clock);

    reg [25:0] COUNT = 0;
    reg desired = 0;
    
    always @ (posedge CLOCK) begin
        COUNT <= COUNT + 1;
        desired <= ( COUNT == 4'b0000 ) ? ~desired : desired;
    end
    
    assign desired_clock = desired;
    
endmodule
