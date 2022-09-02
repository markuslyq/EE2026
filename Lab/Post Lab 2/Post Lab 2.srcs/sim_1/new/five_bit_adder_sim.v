`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2020 17:36:37
// Design Name: 
// Module Name: five_bit_adder_sim
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


module five_bit_adder_sim(

    );
    
    reg [4:0] sim_A, sim_B;
    reg sim_C0 = 1;
    
    wire [4:0] sim_S;
    wire sim_C5;
    
    five_bit_adder simulation(.A(sim_A), .B(sim_B), .C0(sim_C0), .S(sim_S), .C5(sim_C5));
    
    initial
    begin
        sim_A = 5'b00000; sim_B = 5'b11111; #100;
        sim_A = 5'b10101; sim_B = 5'b10101; #100;
        sim_A = 5'b01010; sim_B = 5'b01010; #100;
        sim_A = 5'b01101; sim_B = 5'b11101; #100;
        sim_A = 5'b11011; sim_B = 5'b00001; #100;
        sim_A = 5'b10100; sim_B = 5'b00100; #100;
        sim_A = 5'b10101; sim_B = 5'b00110; #100;
        sim_A = 5'b00001; sim_B = 5'b00000; #100;
        sim_A = 5'b10001; sim_B = 5'b11111; #100;
        sim_A = 5'b10000; sim_B = 5'b10001; #100;

    end
    
endmodule
