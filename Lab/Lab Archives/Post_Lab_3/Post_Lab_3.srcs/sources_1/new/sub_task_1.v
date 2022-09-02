`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2020 19:32:15
// Design Name: 
// Module Name: sub_task_1
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


module sub_task_1(input CLOCK, SW15, output reg [7:0] num_display);

    reg [7:0] num1 = 8'b11111001;
    reg [7:0] num2 = 8'b10100100;
    reg [7:0] num3 = 8'b10110000;
    reg [7:0] num4 = 8'b10011001;
    reg [7:0] num5 = 8'b10010010;
    reg [2:0] count = 1;
    
    
    wire new_clock;
    
    sub_task_1_clock clock(CLOCK, new_clock);
    
    always @ (posedge new_clock) begin
        if (SW15 == 0)
        begin
            case(count)
                3'd1 : num_display <= num1;
                3'd2 : num_display <= num2;
                3'd3 : num_display <= num3;
                3'd4 : num_display <= num4;
                3'd5 : 
                    begin
                        num_display <= num5;
                        count <= 0;
                    end
                default: count <= 0;
            endcase
            count <= count + 1;
        end
    end

            

            
    
    
endmodule
