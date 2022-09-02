`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.09.2020 10:58:26
// Design Name: 
// Module Name: two_bit_adder_sim
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


module two_bit_adder_sim(

    );
    
    reg [1:0] sim_A, sim_B;
    reg sim_Cin;
    
    wire [1:0] sim_S;
    wire sim_Cout;
    
    two_bit_adder simulation(.A(sim_A), .B(sim_B), .C0(sim_Cin), .S(sim_S), .C2(sim_Cout));
    
    initial
    begin
        sim_A = 2'b00 ; sim_B = 2'b00 ; sim_Cin = 0; #10;
        sim_A = 2'b01 ; sim_B = 2'b10 ; sim_Cin = 0; #10;
        sim_A = 2'b00 ; sim_B = 2'b11 ; sim_Cin = 0; #10;
        sim_A = 2'b01 ; sim_B = 2'b11 ; sim_Cin = 1; #10;
        sim_A = 2'b11 ; sim_B = 2'b11 ; sim_Cin = 1; #10;
        
    end 
endmodule
