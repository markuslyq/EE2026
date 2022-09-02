`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2020 01:38:20
// Design Name: 
// Module Name: lab3_assignment_sim
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


module lab3_assignment_sim(

    );
    reg sim_CLOCK;
    reg sim_SW15 = 0;
        
    Post_Lab_3_Assignment simulation(sim_CLOCK, sim_SW15);
        
    initial
        begin
            sim_CLOCK = 0;
        end
            
        always
        begin
            #5 sim_CLOCK = ~sim_CLOCK;
        end
endmodule
