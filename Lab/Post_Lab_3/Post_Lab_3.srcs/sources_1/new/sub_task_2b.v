`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.09.2020 19:55:15
// Design Name: 
// Module Name: sub_task_2b
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


module sub_task_2b(input CLOCK, SW15, SW0, SW1, output reg [7:0] num_display, reg [15:0] led);    
    
    reg [7:0] num0 = 8'b10000110;
    reg [7:0] num1 = 8'b11111001;
    reg [7:0] num2 = 8'b10100100;
    reg [7:0] num3 = 8'b10110000;
    reg [7:0] num4 = 8'b10011001;
    reg [7:0] num5 = 8'b10010010;
    reg [7:0] num6 = 8'b10000010;
    reg [7:0] num7 = 8'b11111000;
    reg [7:0] num8 = 8'b10000000;
    reg [7:0] num9 = 8'b10010000;
    reg [7:0] num10 = 8'b10001000;
    reg [7:0] num11 = 8'b10000011;
    reg [7:0] num12 = 8'b11000110;
    reg [7:0] num13 = 8'b10100001;
    reg [7:0] num14 = 8'b10000110;
    reg [7:0] num15 = 8'b10001110;
    reg [7:0] num16 = 8'b00001110;
    
    reg [5:0] led_count = 0;
    
    wire clock_Foff;
    
    sub_task_2_F_off F1(CLOCK, Foff);
    
    always @ (posedge Foff) begin
        if(SW15 == 1 && SW0 == 0 && SW1 == 0)
            begin 
                case(led_count)
                    16'd0000000000000000: 
                        begin
                            num_display <= num0;
                            led_count <= 0;
                        end
                    16'd0000000000000001: 
                        begin
                            num_display = num1;
                            led_count <= 1;
                        end
                    16'd0000000000000011: 
                        begin
                            num_display = num2;
                            led_count <= 2;
                        end
                    16'd0000000000000111: 
                        begin
                            num_display = num3;
                            led_count <= 3;
                        end
                    16'd0000000000001111: 
                        begin
                            num_display = num4;
                            led_count <= 4;
                        end
                    16'd0000000000011111: 
                        begin
                            num_display = num5;
                            led_count <= 5;
                        end
                    16'd0000000000111111: 
                        begin
                            num_display = num6;
                            led_count <= 6;
                        end
                    16'd0000000001111111: 
                        begin
                            num_display = num7;
                            led_count <= 7;
                        end
                    16'd0000000011111111: 
                        begin
                            num_display = num8;
                            led_count <= 8;
                        end
                    16'd0000000111111111: 
                        begin
                            num_display = num9;
                            led_count <= 9;
                        end
                    16'd0000001111111111: 
                        begin
                            num_display = num10;
                            led_count <= 10;
                        end
                    16'd0000011111111111: 
                        begin
                            num_display = num11;
                            led_count <= 11;
                        end
                    16'd0000111111111111: 
                        begin
                            num_display = num12;
                            led_count <= 12;
                        end
                    16'd0001111111111111: 
                        begin
                            num_display = num13;
                            led_count <= 13;
                        end
                    16'd0011111111111111: 
                        begin
                            num_display = num14;
                            led_count <= 14;
                        end
                    16'd0111111111111111: 
                        begin
                            num_display = num15;
                            led_count <= 15;
                        end
                    16'd1111111111111111: 
                        begin
                            num_display = num16;
                            led_count <= 16;
                        end
                    default: 
                        begin
                            num_display = num0;
                            led_count <= 0;
                        end
                endcase
                if (led_count == 16)
                    led[15] <= 1;
                led <= led >> 1;
            end    
    end
           

endmodule
