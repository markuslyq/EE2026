`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.09.2020 09:48:30
// Design Name: 
// Module Name: blinking_led_simulation
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


module blinking_led_simulation(

    );
    
    reg sim_switch = 1;
    reg sim_CLOCK;
    wire sim_LED;
    
    
    slow_blinking_led sim(.CLOCK(sim_CLOCK), .switch(sim_switch), .LED(sim_LED));
    
    initial
    begin
        sim_CLOCK = 0;
    end
    
    always
    begin
        #5 sim_CLOCK = ~sim_CLOCK;
        #500 sim_switch = ~sim_switch;
    end
    
endmodule
