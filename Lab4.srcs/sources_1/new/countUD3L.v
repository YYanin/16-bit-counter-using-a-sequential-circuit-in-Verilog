`timescale 1ns / 1ps


module countUD3L(
    input clk,
    input [2:0] Din,
    input Up,
    input Dw,
    input LD,
    
    //For the logic
    //input Ce,
    
    
    output [2:0] Q,
    output UTC,
    output DTC
 
    );
    
    //wire [2:0] Q;
    wire [2:0] D;
    
    //assign Ce = 1'b1;

    //UTC trigger
    assign UTC = &Q;
    
    //DTC trigger
    assign DTC = ~Q[0] & ~Q[1] & ~Q[2];
    
    

    //For counting up
    FDRE #(.INIT(1'b0)) Flip0 (.C(clk), .R(1'b0), .CE(LD|Up|Dw), .D(D[0]), .Q(Q[0]));
    assign D[0] = (LD&Din[0])|(~LD&Up&(Up^Q[0]))|(~LD&~Up&Dw&(Dw^Q[0]))|(~LD&~Up&~Dw&Q[0]);
    
    FDRE #(.INIT(1'b0)) Flip1 (.C(clk), .R(1'b0), .CE(LD|Up|Dw), .D(D[1]), .Q(Q[1])); 
    assign D[1] = (LD&Din[1])|(~LD&Up&(Q[1]^(Q[0]& Up)))|(~LD&~Up&Dw&(Q[1]^(~Q[0]&Dw)))|(~LD&~Up&~Dw&Q[1]);
    
    FDRE #(.INIT(1'b0)) Flip2 (.C(clk),.R(1'b0), .CE(LD|Up|Dw), .D(D[2]), .Q(Q[2]));
    assign D[2] = (LD&Din[2])|(~LD&Up&(Q[2]^(Q[1]&Q[0]&Up)))|(~LD&~Up&Dw&(Q[2]^(~Q[1]&~Q[0]&Dw)))|(~LD&~Up&~Dw&Q[2]);
    
//    assign D[0] = (LD&Din[0])|(~LD&Up&~Dw&(~Q[0]))|(~LD&~Up&Dw&(~Q[0]))|(~LD&~Up&~Dw&Q[0]);
//    assign D[1] = (LD&Din[1])|(~LD&Up&~Dw&(Q[1]^(Q[0]& Up)))|(~LD&~Up&Dw&(Q[1]^(~Q[0]&Dw)))|(~LD&~Up&~Dw&Q[1]);
//    assign D[2] = (LD&Din[2])|(~LD&Up&~Dw&(Q[2]^(Q[1]&Q[0]&Up)))|(~LD&~Up&Dw&(Q[2]^(~Q[1]&~Q[0]&Dw)))|(~LD&~Up&~Dw&Q[2]);
    
endmodule
