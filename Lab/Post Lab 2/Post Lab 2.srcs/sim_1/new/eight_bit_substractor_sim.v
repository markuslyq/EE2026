`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2020 20:46:53
// Design Name: 
// Module Name: eight_bit_substractor_sim
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


module eight_bit_substractor_sim(

    );
    
    reg [7:0] sim_A, sim_B;
    reg sim_C0 = 1;
        
    wire [7:0] sim_S;
    wire sim_C8;
        
    eight_bit_substractor simulation(.A(sim_A), .B(sim_B), .C0(sim_C0), .S(sim_S), .C8(sim_C8));
        
    initial
    begin
        sim_A = 8'b00000000; sim_B = 8'b11111111; #100;
        sim_A = 8'b10101010; sim_B = 8'b10101010; #100;
        sim_A = 8'b01010101; sim_B = 8'b01010101; #100;
        sim_A = 8'b00111001; sim_B = 8'b00011111; #100;
        sim_A = 8'b10011011; sim_B = 8'b11111011; #100;
        sim_A = 8'b10000000; sim_B = 8'b11111111; #100;
        sim_A = 8'b01111111; sim_B = 8'b00000001; #100;
        sim_A = 8'b00110010; sim_B = 8'b11001110; #100;
        sim_A = 8'b00000000; sim_B = 8'b01111111; #100;
        sim_A = 8'b00000000; sim_B = 8'b10000001; #100;
    end
    
endmodule
