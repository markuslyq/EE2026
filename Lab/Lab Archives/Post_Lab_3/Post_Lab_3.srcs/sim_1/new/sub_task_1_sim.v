`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2020 20:52:55
// Design Name: 
// Module Name: sub_task_1_sim
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


module sub_task_1_sim(

    );
    
    reg sim_CLOCK;
    
    sub_task_1 simulation(sim_CLOCK);
    
    initial
        begin
            sim_CLOCK = 0;
        end
        
        always
        begin
            #5 sim_CLOCK = ~sim_CLOCK;
        end
        
endmodule
