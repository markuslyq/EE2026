`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2020 17:21:13
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


module main(input CLOCK, btnU, btnL, btnC, btnR, [15:0] SW, output reg [3:0] AN = 0, output reg [15:0] led = 16'b0000000000000000, output reg [7:0] display);

    wire sub_task_A_clock, sub_task_B_6hz_clock, main_clock, UpButton, LeftButton, CentreButton, RightButton;
    reg just_start = 1;
    reg [2:0] tally_counter = 0;
    reg [8:0] counter = 0;
    reg [5:0] led_increment_counter = 0;
    reg [6:0] led_decrement_counter = 0;
    reg [31:0] btnUcounter = 0;
    reg [1:0] taskAcounter = 0;
    reg [3:0] total_person_count = 0;
    reg [1:0] room0_count = 0;
    reg [1:0] room1_count = 0;
    reg [1:0] room2_count = 0;
    reg [18:0] error_counter = 0;
    reg error = 0;
    reg error0 = 0;
    reg error1 = 0;
    reg error2 = 0;
    reg pass = 0;
    reg fail = 0;
    reg [1:0] previousBtn2 = 0;
    reg [1:0] previousBtn1 = 0;
    reg [1:0] previousBtn0 = 0;
   
    main_clock_divider main_CLOCK (CLOCK, main_clock);
    sub_task_A_clock A_CLOCK(CLOCK, sub_task_A_clock);
    sub_task_B_clock B_6hzCLOCK(CLOCK, sub_task_B_6hz_clock);
    single_pulse_output UP(btnU, main_clock, UpButton);
    single_pulse_output LEFT(btnL, main_clock, LeftButton);
    single_pulse_output CENTRE(btnC, main_clock, CentreButton);
    single_pulse_output RIGHT(btnR, main_clock, RightButton);
    
    always @ (posedge sub_task_A_clock)
    begin
        if (btnUcounter == 0)
        begin
            if (just_start == 1)
            begin
                counter <= counter + 1;
                led_increment_counter <= led_increment_counter + 1;
                if (led_increment_counter == 0 && SW == 16'b1111111111111111)
                begin
                    if (led == 16'd0)
                        led = led + 1;
                    else if (led != 16'b1111111111111111)
                    begin
                        led = led << 1;
                        led = led + 1;
                    end
                end
                if (counter == 0 && led == 16'b1111111111111111)
                begin
                    tally_counter <= tally_counter + 1;
                    if (tally_counter == 3'd5)
                    begin
                        tally_counter <= 1;
                        just_start <= 0;
                    end
                end
            end
            else
            begin 
                if (led == 16'b1111111111111111)
                begin
                    tally_counter <= tally_counter + 1;
                    if (tally_counter == 3'd5)
                        tally_counter <= 1;
                end
            end
        end
        else
        begin
            led_decrement_counter <= led_decrement_counter + 1;
            if (led_decrement_counter == 0 && SW == 16'b1111111111111110)
            begin
                if (led != 16'd0)
                    led = led >> 1;
            end        
            taskAcounter <= taskAcounter + 1;    
        end
    end
    
    always @ (posedge main_clock)
    begin
        if (UpButton == 1)
            btnUcounter <= btnUcounter + 1;    
        if ((btnUcounter == 0) && (SW == 16'b1111111111111111))
        begin
            case(tally_counter)
                3'd1:
                begin
                    display <= 8'b10000111; //display "t".
                    AN <= 4'b0111;
                end
                3'd2:
                begin
                    display <= 8'b10001000; //display "A".
                    AN <= 4'b1011;
                end
                3'd3:
                begin
                    display <= 8'b11001111; //display "| ".
                    AN <= 4'b1101;
                end
                3'd4:
                begin
                    display <= 8'b11111001; //display " |".
                    AN <= 4'b1101;
                end
                3'd5:
                begin
                    display <= 8'b10010001; //display "Y".
                    AN <= 4'b1110;
                end
                default: AN <= 4'b1111;
            endcase
        end
        else if (btnUcounter != 0)
            begin
                if(SW == 16'b1111111111111111)
                begin
                    if (error == 0)
                    begin
                        if (LeftButton == 1)
                        begin
                            room2_count <= (room2_count == 3) ? room2_count : room2_count + 1;
                            previousBtn2 <= (room2_count == 3) ? previousBtn2 : previousBtn2 + 1;
                            previousBtn1 <= 0;
                            previousBtn0 <= 0;
                        end
                        else if (CentreButton == 1)
                        begin 
                            room1_count <= (room1_count == 3) ? room1_count : room1_count + 1;
                            previousBtn2 <= 0;
                            previousBtn1 <= (room1_count == 3) ? previousBtn1 : previousBtn1 + 1;
                            previousBtn0 <= 0;                            
                        end
                        else if (RightButton == 1) 
                        begin
                            room0_count <= (room0_count == 3) ? room0_count :  room0_count + 1;
                            previousBtn2 <= 0;
                            previousBtn1 <= 0;
                            previousBtn0 <= (room0_count == 3) ? previousBtn0 : previousBtn0 + 1;                                                        
                        end
                        
                        if ( (room2_count - room1_count) == 2 || (room2_count - room0_count) == 2 || previousBtn2 > 1)
                        begin
                            previousBtn2 <= 1;
                            room2_count <= room2_count - 1;
                            error <= 1;
                            error2 <= 1;
                        end 
                        
                        else if( (room1_count - room2_count) == 2 || (room1_count - room0_count) == 2 || previousBtn1 > 1)
                        begin
                            previousBtn1 <= 1;
                            room1_count <= room1_count - 1;
                            error <= 1;
                            error1 <= 1;
                        end
                        
                        else if( (room0_count - room2_count) == 2 || (room0_count - room1_count) == 2 || previousBtn0 > 1)
                        begin
                            previousBtn0 <= 1;
                            room0_count <= room0_count - 1;
                            error <= 1;
                            error0 <= 1;
                        end                 
                    end
                    
                    if (error == 1)
                    begin;
                        error_counter = error_counter + 1;
                        if (error_counter == 0)
                        begin
                            if (error2 == 1)
                            begin
                                error2 <= 0;
                            end
                            if (error1 == 1)
                            begin
                                error1 <= 0;
                            end
                            if (error0 == 1)
                            begin
                                error0 <= 0;
                            end 
                            error <= 0;                                            
                        end       
                    end  
            
                    if (UpButton == 1)
                    begin
                        room0_count <= 0;
                        room1_count <= 0;
                        room2_count <= 0;
                        error <= 0;
                        error_counter <= 0;
                        error0 <= 0;
                        error1 <= 0;
                        error2 <= 0;
                        total_person_count <= 0;
                        pass <= 0;
                        previousBtn2 <= 0;
                        previousBtn1 <= 0;
                        previousBtn0 <= 0;
                    end
                    
                    total_person_count <= room0_count + room1_count + room2_count;
                end  
                else if(SW == 16'b1111111111111110)
                begin
                    if (LeftButton == 1)
                    begin
                        room2_count <= (room2_count == 0) ? room2_count : room2_count - 1;
                    end
                    else if (CentreButton == 1)
                    begin 
                        room1_count <= (room1_count == 0) ? room1_count : room1_count - 1;
                    end
                    else if (RightButton == 1) 
                    begin
                        room0_count <= (room0_count == 0) ? room0_count : room0_count - 1;
                    end
                    
                    total_person_count <= room0_count + room1_count + room2_count;
                    if (total_person_count == 0 && led != 16'd0)
                    begin
                        pass <= 1;
                    end
                    else if (led == 16'd0 && total_person_count > 0)
                    begin
                        fail <= 1;
                    end                    
                end
                         
                case(taskAcounter)
                    2'd3:
                    begin
                        AN <= 4'b0111;
                        case(total_person_count)
                            4'd0: display <= 8'b11000000;
                            4'd1: display <= 8'b11111001;
                            4'd2: display <= 8'b10100100;
                            4'd3: display <= 8'b10110000;
                            4'd4: display <= 8'b10011001;
                            4'd5: display <= 8'b10010010;
                            4'd6: display <= 8'b10000010;
                            4'd7: display <= 8'b11111000;
                            4'd8: display <= 8'b10000000;
                            4'd9: display <= 8'b10010000;
                        endcase
                        if(pass == 1)
                        begin
                            display <= 8'b10001100;
                        end
                        else if (fail == 1)
                        begin
                            display <= 8'b10001110;
                        end
                    end
                    2'd2:
                    begin
                        AN <= 4'b1011;
                        case(room2_count)
                            2'd0: display <= 8'b11111111;
                            2'd1: display <= 8'b11110111;
                            2'd2: display <= 8'b10110111;
                            2'd3: display <= 8'b10110110;
                        endcase
                        if (error2 == 1)                        
                        begin
                            AN[2] <= error_counter[13];
                            display[7] <= error_counter[13]; 
                        end
                        if (pass == 1)
                        begin 
                            display <= 8'b10001000;
                        end
                        else if (fail == 1)
                        begin
                            display <= 8'b10001000;
                        end                                                                   
                    end
                    2'd1:
                    begin
                        AN <= 4'b1101;
                        case(room1_count)
                            2'd0: display <= 8'b11111111;
                            2'd1: display <= 8'b11110111;
                            2'd2: display <= 8'b10110111;
                            2'd3: display <= 8'b10110110;
                        endcase  
                        if (error1 == 1)
                        begin
                            AN[1] <= error_counter[13];
                            display[7] <= error_counter[13];                         
                        end
                        if (pass == 1)
                        begin
                            display <= 8'b10010010;
                        end
                        else if (fail == 1)
                        begin
                            display <= 8'b11001111;
                        end                                      
                    end
                    2'd0:
                    begin
                        AN <= 4'b1110;                  
                        case(room0_count)
                            2'd0: display <= 8'b11111111;
                            2'd1: display <= 8'b11110111;
                            2'd2: display <= 8'b10110111;
                            2'd3: display <= 8'b10110110;
                        endcase       
                        if (error0 == 1)
                        begin
                            AN[0] <= error_counter[13];
                            display[7] <= error_counter[13];    
                        end 
                        if (pass == 1)
                        begin
                            display <= 8'b10010010;
                        end
                        else if (fail == 1)
                        begin
                            display <= 8'b11000111;
                        end                                                              
                    end
                endcase
            end 
    end    
endmodule
