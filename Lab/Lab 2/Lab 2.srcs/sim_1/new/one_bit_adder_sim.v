`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.09.2020 10:28:45
// Design Name: 
// Module Name: one_bit_adder_sim
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


module one_bit_adder_sim(

    );
    
    reg sim_A, sim_B, sim_Cin;
    wire sim_S, sim_Cout;
    
    one_bit_adder simulation(.A(sim_A), .B(sim_B), .Cin(sim_Cin), .S(sim_S), .Cout(sim_Cout));
    
    initial
    begin
        sim_A = 0; sim_B = 0; sim_Cin = 0; #10;
        sim_A = 0; sim_B = 1; sim_Cin = 0; #10;
        sim_A = 1; sim_B = 0; sim_Cin = 0; #10;
        sim_A = 0; sim_B = 1; sim_Cin = 1; #10;
        sim_A = 1; sim_B = 1; sim_Cin = 1; #10;

    end
endmodule
