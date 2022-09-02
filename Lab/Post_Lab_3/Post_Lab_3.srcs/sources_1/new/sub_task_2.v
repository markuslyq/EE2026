`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2020 22:11:30
// Design Name: 
// Module Name: sub_task_2
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


module sub_task_2a(input CLOCK, SW15, SW0, SW1, output reg [7:0] num_display, reg [15:0] led = 0);    
    
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
       
    wire clock_Fon;
    wire F_blink;
    
    sub_task_2_F_on F1(CLOCK, Fon);
    sub_task_2_F_blink F2(CLOCK, F_blink);
    

    always @ (posedge Fon) begin
        if(SW15 == 1 && SW0 == 1 && SW1 == 0)
            begin
                led_count <= (led_count == 16) ? led_count : led_count + 1;
                if (led == 0)
                    led <= led + 1;
                else if (led == 16'b1111111111111111)
                    led[15] <= F_blink;
                else
                    begin
                        led <= led << 1;
                        led <= led + 1;
                    end
                case(led_count)
                    5'd0: num_display <= num0;
                    5'd1: num_display <= num1;
                    5'd2: num_display <= num2;
                    5'd3: num_display <= num3;
                    5'd4: num_display <= num4;
                    5'd5: num_display <= num5;
                    5'd6: num_display <= num6;
                    5'd7: num_display <= num7;
                    5'd8: num_display <= num8;
                    5'd9: num_display <= num9;
                    5'd10: num_display <= num10;
                    5'd11: num_display <= num11;
                    5'd12: num_display <= num12;
                    5'd13: num_display <= num13;
                    5'd14: num_display <= num14;
                    5'd15: num_display <= num15;
                    5'd16: num_display <= num16;
                    default: num_display <= num0;
                endcase
            end    
//        else
//            num_display <= 8'b11111111;
    end
           

endmodule
