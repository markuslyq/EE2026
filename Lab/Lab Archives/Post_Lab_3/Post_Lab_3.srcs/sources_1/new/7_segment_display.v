`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2020 23:05:20
// Design Name: 
// Module Name: 7_segment_display
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


module seven_segment_display(input [4:0] INPUT, output reg [7:0] OUTPUT);

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
    
    
    
    always @ (INPUT) begin
        case(INPUT)
            5'd0: OUTPUT = num0;
            5'd1: OUTPUT = num1;
            5'd2: OUTPUT = num2;
            5'd3: OUTPUT = num3;
            5'd4: OUTPUT = num4;
            5'd5: OUTPUT = num5;
            5'd6: OUTPUT = num6;
            5'd7: OUTPUT = num7;
            5'd8: OUTPUT = num8;
            5'd9: OUTPUT = num9;
            5'd10: OUTPUT = num10;
            5'd11: OUTPUT = num11;
            5'd12: OUTPUT = num12;
            5'd13: OUTPUT = num13;
            5'd14: OUTPUT = num14;
            5'd15: OUTPUT = num15;
            5'd16: OUTPUT = num16;
        endcase
    end
        
endmodule
