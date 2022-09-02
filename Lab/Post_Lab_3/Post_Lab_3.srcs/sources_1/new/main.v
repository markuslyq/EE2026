`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.09.2020 20:26:27
// Design Name: 
// Module Name: main
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


module main(input CLOCK, SW15, SW0, SW1, output reg [7:0] num_display,  reg [3:0] AN_input = 4'b0111, reg [15:0] led);

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
    
    reg [2:0] task1counter = 1;
    reg [5:0] led_count_add = 0;
    reg [5:0] led_count_minus = 0;
    reg [5:0] led_count = 0;
    reg [2:0] counter = 0;

    
    wire sub_task_1_clock;
    wire Fon;
    wire F_blink;
     
    sub_task_1_clock counter_clock(CLOCK, sub_task_1_clock);
    sub_task_2_F_on F1(CLOCK, Fon);
    sub_task_2_F_blink F3(CLOCK, F_blink);
    
    always @ (posedge sub_task_1_clock) begin
        if (SW15 == 0)
            begin 
                task1counter <= task1counter + 1;
                if (task1counter == 5)
                    task1counter <= 1;
            end
    end
    
    always @ (posedge Fon) begin
        counter = counter + 1;
        if(SW15 == 1 && SW0 == 1 && SW1 == 0)
            led_count <= (led_count == 16) ? led_count: led_count + 1;
        else if (SW15 == 1 && SW0 == 0 && SW1 == 0)
            begin
                if (counter == 0)
                    led_count <= (led_count == 0)? led_count : led_count - 1;
            end
        if(SW1 == 1)
            led_count <= led_count;
    end
    
    always @ (posedge CLOCK) begin
        if (SW15 == 0) begin
            case(task1counter)
                3'd1 : num_display <= num1;
                3'd2 : num_display <= num2;
                3'd3 : num_display <= num3;
                3'd4 : num_display <= num4;
                3'd5 : num_display <= num5;
            endcase
        end
        else 
            begin
                case(led_count)
                    5'd0: begin 
                        num_display <= num0;
                        led = 16'b0000000000000000;
                    end
                    5'd1: begin 
                        num_display <= num1;
                        led = 16'b0000000000000001;
                    end
                    5'd2: begin
                        num_display <= num2;
                        led = 16'b0000000000000011;
                    end
                    5'd3: begin 
                        num_display <= num3;
                        led = 16'b0000000000000111;
                    end
                    5'd4: begin
                        num_display <= num4;
                        led = 16'b0000000000001111;
                    end
                    5'd5: begin
                        num_display <= num5;
                        led = 16'b0000000000011111;
                    end
                    5'd6: begin
                        num_display <= num6;
                        led = 16'b0000000000111111;
                    end
                    5'd7: begin
                        num_display <= num7;
                        led = 16'b0000000001111111;
                    end
                    5'd8: begin
                        num_display <= num8;
                        led = 16'b0000000011111111;
                    end
                    5'd9: begin
                        num_display <= num9;
                        led = 16'b0000000111111111;
                    end
                    5'd10: begin
                        num_display <= num10;
                        led = 16'b0000001111111111;
                    end
                    5'd11: begin
                        num_display <= num11;
                        led = 16'b0000011111111111;
                    end
                    5'd12: begin
                        num_display <= num12;
                        led = 16'b0000111111111111;
                    end
                    5'd13: begin
                        num_display <= num13;
                        led = 16'b0001111111111111;
                    end
                    5'd14: begin
                        num_display <= num14;
                        led = 16'b0011111111111111;
                    end
                    5'd15: begin
                        num_display <= num15;
                        led = 16'b0111111111111111;
                    end
                    5'd16: begin
                        num_display <= num16;
                        led = 16'b1111111111111111;
                        led[15] = F_blink;
                    end
                endcase
            end
    end 
endmodule
