`timescale 1ns / 1ps


module EdgeDetector(
    input clk,
    input Ce,
    output Out 
    );
    
    wire [1:0] Q;
    
    FDRE #(.INIT(1'b0)) Flip0_edge (.C(clk), .R(1'b0), .CE(1'b1), .D(Ce), .Q(Q[0]));
    FDRE #(.INIT(1'b0)) Flip1_edge (.C(clk), .R(1'b0), .CE(1'b1), .D(Q[0]), .Q(Q[1]));
    
    assign Out = Q[0]&~Q[1];
    
endmodule
