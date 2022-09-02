`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2020 00:54:08
// Design Name: 
// Module Name: Post_Lab_3_Assignment
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


module Post_Lab_3_Assignment(input CLOCK, SW15, SW0, SW1, output reg [7:0] num_display,  reg [3:0] AN_input = 4'b0111, reg [15:0] led = 0);

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
    
    reg run = 1;
    reg run_task2a = 1;
    reg run_task2b = 1;

    
    reg [2:0] count = 1;
    reg [5:0] led_count = 0;
    
    wire F_blink;
    sub_task_2_F_Blink Fblink(CLOCK, F_blink);
    
    reg[31:0] freq = 0;
    
    always @ (posedge CLOCK) begin
        freq <= freq + 1;
        case(SW15)
            0:
                begin
                    case(freq[25])
                        1: 
                            begin
                                case (run)
                                1: 
                                    begin
                                        case(count)
                                            3'd1 : num_display <= num1;
                                            3'd2 : num_display <= num2;
                                            3'd3 : num_display <= num3;
                                            3'd4 : num_display <= num4;
                                            3'd5 : 
                                                begin
                                                    num_display <= num5;
                                                    count = 0;
                                                end
                                            default: count = 0;
                                        endcase
                                        count <= count + 1;
                                        run = 0;
                                    end
                                0: run = run;
                                endcase
                            end
                        0: 
                            begin
                            count <= count;
                            run = 1;
                            end
                    endcase
                end
            1: 
                if (SW1 == 1)
                    begin
                        led_count = led_count;
                        led = led;
                    end 
                else
                    begin
                        begin
                            case(SW0)
                                1: 
                                    begin
                                        case(freq[23])
                                            1:
                                                begin
                                                    case(run_task2a)
                                                        1:
                                                            begin
                                                                led_count = (led_count == 16) ? led_count : led_count + 1;
                                                                if(led == 0)
                                                                    led = led + 1;
                                                                else if (led[15] == 1)
                                                                    begin
                                                                        led[15] = F_blink;
                                                                        led = led;
                                                                    end
                                                                else
                                                                    begin
                                                                        led = led << 1;
                                                                        led = led + 1;
                                                                    end
                                                                case(led_count)
                                                                                5'd0: num_display = num0;
                                                                                5'd1: num_display = num1;
                                                                                5'd2: num_display = num2;
                                                                                5'd3: num_display = num3;
                                                                                5'd4: num_display = num4;
                                                                                5'd5: num_display = num5;
                                                                                5'd6: num_display = num6;
                                                                                5'd7: num_display = num7;
                                                                                5'd8: num_display = num8;
                                                                                5'd9: num_display = num9;
                                                                                5'd10: num_display = num10;
                                                                                5'd11: num_display = num11;
                                                                                5'd12: num_display = num12;
                                                                                5'd13: num_display = num13;
                                                                                5'd14: num_display = num14;
                                                                                5'd15: num_display = num15;
                                                                                5'd16: num_display = num16;
                                                                                default: num_display = num0;
                                                                            endcase
                                                                   run_task2a = 0;
                                                            end
                                                        0: run_task2a = run_task2a;
                                                    endcase
                                                end
                                            0:
                                                begin
                                                    run_task2a = 1;
                                                end                   
                                                    endcase
                                                end
                                0: 
                                    begin
                                        case(freq[26])
                                            1:
                                                begin
                                                    case(run_task2b)
                                                        1:
                                                            begin
                                                                if (led_count == 16)
                                                                    led[15] = 1;
                                                                led_count = (led_count == 0) ? led_count : led_count - 1;
                                                                led = led >> 1;   
                                                                case(led_count)
                                                                                        5'd0: num_display = num0;
                                                                                        5'd1: num_display = num1;
                                                                                        5'd2: num_display = num2;
                                                                                        5'd3: num_display = num3;
                                                                                        5'd4: num_display = num4;
                                                                                        5'd5: num_display = num5;
                                                                                        5'd6: num_display = num6;
                                                                                        5'd7: num_display = num7;
                                                                                        5'd8: num_display = num8;
                                                                                        5'd9: num_display = num9;
                                                                                        5'd10: num_display = num10;
                                                                                        5'd11: num_display = num11;
                                                                                        5'd12: num_display = num12;
                                                                                        5'd13: num_display = num13;
                                                                                        5'd14: num_display = num14;
                                                                                        5'd15: num_display = num15;
                                                                                        5'd16: num_display = num16;
                                                                                        default: num_display = num0;
                                                                endcase
                                                                run_task2b = 0;
                                                            end
                                                        0: run_task2b = run_task2b;
                                                    endcase 
                                                end 
                                            0: run_task2b = 1;
                                        endcase
                                    end
                            endcase
                        end
                    end
                
            default: num_display = num16;
        endcase
    end
                        
                            
                    
                    
endmodule
