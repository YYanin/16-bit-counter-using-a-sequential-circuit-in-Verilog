`timescale 1ns / 1ps


module countUD5L(
    
    input clk,
    input [4:0] Din,
    input Up,
    input Dw,
    input LD,
    
    //For the logic
    //input Ce,
    
    
    output [4:0] Q,
    output UTC,
    output DTC
    
    );
    
    
        //wire [2:0] Q;
    wire [4:0] D;
    
    //assign Ce = 1'b1;

    //UTC trigger
    assign UTC = &Q;
    
    //DTC trigger
    assign DTC = ~Q[0] & ~Q[1] & ~Q[2]& ~Q[3]& ~Q[4]& ~Q[5];
    
    

    //For counting up
    FDRE #(.INIT(1'b0)) Flip0 (.C(clk),.R(1'b0), .CE(LD|Up|Dw), .D(D[0]), .Q(Q[0]));
    assign D[0] = (LD&Din[0])|(~LD&Up&(Up^Q[0]))|(~LD&~Up&Dw&(Dw^Q[0]))|(~LD&~Up&~Dw&Q[0]);
    
    FDRE #(.INIT(1'b0)) Flip1 (.C(clk),.R(1'b0), .CE(LD|Up|Dw), .D(D[1]), .Q(Q[1])); 
    assign D[1] = (LD&Din[1])|(~LD&Up&(Q[1]^(Q[0]& Up)))|(~LD&~Up&Dw&(Q[1]^(~Q[0]&Dw)))|(~LD&~Up&~Dw&Q[1]);
    
    FDRE #(.INIT(1'b0)) Flip2 (.C(clk),.R(1'b0), .CE(LD|Up|Dw), .D(D[2]), .Q(Q[2]));
    assign D[2] = (LD&Din[2])|(~LD&Up&(Q[2]^(Q[1]&Q[0]&Up)))|(~LD&~Up&Dw&(Q[2]^(~Q[1]&~Q[0]&Dw)))|(~LD&~Up&~Dw&Q[2]);
    
    FDRE #(.INIT(1'b0)) Flip3 (.C(clk),.R(1'b0), .CE(LD|Up|Dw), .D(D[3]), .Q(Q[3]));
    assign D[3] = (LD&Din[3])|(~LD&Up&(Q[3]^(Q[1]&Q[2]&Q[0]&Up)))|(~LD&~Up&Dw&(Q[3]^(~Q[1]&~Q[2]&~Q[0]&Dw)))|(~LD&~Up&~Dw&Q[3]);
    
    FDRE #(.INIT(1'b0)) Flip4 (.C(clk),.R(1'b0), .CE(LD|Up|Dw), .D(D[4]), .Q(Q[4]));
    assign D[4] = (LD&Din[4])|(~LD&Up&(Q[4]^(Q[1]&Q[2]&Q[0]&Q[3]&Up)))|(~LD&~Up&Dw&(Q[4]^(~Q[1]&~Q[2]&~Q[0]&~Q[3]&Dw)))|(~LD&~Up&~Dw&Q[4]);
    
    
    
    //assign D[3] = (LD&Din[3])|(~LD&Up&~Dw&(Q[3]^(Q[1]&Q[2]&Q[0]&Up)))|(~LD&~Up&Dw&(Q[3]^(~Q[1]&~Q[2]&~Q[0]&Dw)))|(~LD&~Up&~Dw&Q[3]);
    //assign D[4] = (LD&Din[4])|(~LD&Up&~Dw&(Q[4]^(Q[1]&Q[2]&Q[0]&Q[3]&Up)))|(~LD&~Up&Dw&(Q[4]^(~Q[1]&~Q[2]&~Q[0]&~Q[3]&Dw)))|(~LD&~Up&~Dw&Q[4]);
endmodule
