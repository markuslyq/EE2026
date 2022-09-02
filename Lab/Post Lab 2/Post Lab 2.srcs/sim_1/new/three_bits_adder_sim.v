`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2020 20:09:57
// Design Name: 
// Module Name: three_bits_adder_sim
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


module three_bits_adder_sim(

    );
    
    reg [2:0] sim_A, sim_B;
    reg sim_C0 = 1;
    
    wire [2:0] sim_S;
    wire sim_C3;
    
    three_bits_adder simulation(.A(sim_A), .B(sim_B), .C0(sim_C0), .S(sim_S), .C3(sim_C3));
    
    initial
    begin
    
        sim_A = 3'b000; sim_B = 5'b111; #100;
        sim_A = 3'b101; sim_B = 5'b101; #100;
        sim_A = 3'b010; sim_B = 5'b010; #100;
        sim_A = 3'b101; sim_B = 5'b101; #100;
        sim_A = 3'b011; sim_B = 5'b001; #100;
        sim_A = 3'b100; sim_B = 5'b100; #100;
        sim_A = 3'b101; sim_B = 5'b110; #100;
        sim_A = 3'b001; sim_B = 5'b000; #100;
        sim_A = 3'b001; sim_B = 5'b111; #100;
        sim_A = 3'b000; sim_B = 5'b001; #100;
    
    end
    
endmodule
