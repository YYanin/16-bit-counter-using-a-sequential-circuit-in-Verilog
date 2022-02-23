`timescale 1ns / 1ps


module RingCounter(
    input clk,
    input advance,
    output [3:0] Q
    );
    

    FDRE #(.INIT(1'b1)) RingCFlip0 (.C(clk), .CE(advance), .D(Q[3]), .Q(Q[0])); 
    FDRE #(.INIT(1'b0)) RingCFlip1 (.C(clk), .CE(advance), .D(Q[0]), .Q(Q[1])); 
    FDRE #(.INIT(1'b0)) RingCFlip2 (.C(clk), .CE(advance), .D(Q[1]), .Q(Q[2])); 
    FDRE #(.INIT(1'b0)) RingCFlip3 (.C(clk), .CE(advance), .D(Q[2]), .Q(Q[3])); 
    

endmodule
