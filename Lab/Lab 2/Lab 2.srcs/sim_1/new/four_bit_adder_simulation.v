`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.09.2020 11:40:41
// Design Name: 
// Module Name: four_bit_adder_simulation
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


module four_bit_adder_simulation(

    );
            
    reg [3:0] sim_A, sim_B;
    reg sim_Cin;
    
    wire [3:0] sim_S;
    wire sim_Cout;
    
    four_bit_adder simulation(.A(sim_A), .B(sim_B), .C0(sim_Cin), .S(sim_S), .C4(sim_Cout));
    
    initial
    begin
        sim_A = 4'b0000 ; sim_B = 4'b0000 ; sim_Cin = 0; #10;
        sim_A = 4'b1010 ; sim_B = 4'b0101 ; sim_Cin = 0; #10;
        sim_A = 4'b0011 ; sim_B = 4'b0011 ; sim_Cin = 0; #10;
        sim_A = 4'b1100 ; sim_B = 4'b0011 ; sim_Cin = 1; #10;
        sim_A = 4'b1111 ; sim_B = 4'b1111 ; sim_Cin = 1; #10;
    end 
    
endmodule
