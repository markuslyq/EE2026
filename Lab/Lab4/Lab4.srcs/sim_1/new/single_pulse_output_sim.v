`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2020 09:35:51
// Design Name: 
// Module Name: single_pulse_output_sim
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


module single_pulse_output_sim(

    );
    reg sim_CLOCK; 
    reg sim_pSignal = 0;
    wire sim_output;
    
    single_pulse_output simulation(sim_pSignal, sim_CLOCK, sim_output);
    
    initial
        begin
            sim_CLOCK = 0;
        end
        
        always
        begin
            #5 sim_CLOCK = ~sim_CLOCK;
            
            
        end
        
        always
        begin
            #7 sim_pSignal = ~sim_pSignal;
            #37 sim_pSignal = ~sim_pSignal;
        end
endmodule
