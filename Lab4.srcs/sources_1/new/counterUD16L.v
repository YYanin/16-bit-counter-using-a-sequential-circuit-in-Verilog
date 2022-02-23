`timescale 1ns / 1ps

module counterUD16L(
    input clkin,
    input [15:0] Din,
    input Up,
    input Dw,
    input LD,
    
    
    
    output [15:0] Q,
    //output [15:0] D,
    output UTC,
    output DTC
    );
    
     //wire clk;
     wire [3:0] D;
     wire [3:0] T;
     
     countUD3L First(.clk(clkin), .Up(Up), .Dw(Dw), .LD(LD), .Din(Din[2:0]), .Q(Q[2:0]), .UTC(D[0]), .DTC(T[0]));
     countUD5L Second(.clk(clkin), .Up(D[0]&Up), .Dw(T[0]&Dw), .LD(LD), .Din(Din[7:3]), .Q(Q[7:3]), .UTC(D[1]), .DTC(T[1]));
     countUD5L Third(.clk(clkin), .Up(D[0]&D[1]&Up), .Dw(T[0]&T[1]&Dw), .LD(LD), .Din(Din[12:8]), .Q(Q[12:8]), .UTC(D[2]), .DTC(T[2]));
     countUD3L Fourth(.clk(clkin), .Up(D[0]&D[1]&D[2]&Up), .Dw(T[0]&T[1]&T[2]&Dw), .LD(LD), .Din(Din[15:13]), .Q(Q[15:13]), .UTC(D[3]), .DTC(T[3]));
     assign DTC = T[0]&T[1]&T[2]&T[3];
     assign UTC = D[0]&D[1]&D[2]&D[3];
     //assign Q = D[2:0]&D[7:3]&D[12:8]&D[15:13];
     
     
endmodule
