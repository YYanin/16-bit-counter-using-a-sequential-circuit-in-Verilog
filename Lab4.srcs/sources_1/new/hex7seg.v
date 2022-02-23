`timescale 1ns / 1ps

module hex7seg(
    input [3:0] n,
    
    input e,
    
    output [6:0] Disp
    );
    wire Inverse;
    
    assign Inverse = ~n[0];
    
    
    m8_le AMux(.in({1'b0, n[0], n[0], 1'b0, 1'b0, Inverse, 1'b0, n[0]}), .sel({n[3], n[2], n[1]}), .e(1'b1), .o(Disp[0]));
    m8_le BMux(.in({1'b1, Inverse, n[0], 1'b0,Inverse, n[0], 1'b0,1'b0}), .sel({n[3], n[2], n[1]}), .e(1'b1), .o(Disp[1]));
    m8_le CMux(.in({1'b1, Inverse, 1'b0,1'b0,1'b0,1'b0,Inverse,1'b0}), .sel({n[3], n[2], n[1]}), .e(1'b1),.o(Disp[2]));
    m8_le DMux(.in({n[0],1'b0,Inverse,1'b0,n[0],Inverse,1'b0,n[0]}), .sel({n[3], n[2], n[1]}), .e(1'b1), .o(Disp[3]));
    m8_le EMux(.in({1'b0,1'b0,1'b0,n[0],n[0], 1'b1, n[0], n[0]}), .sel({n[3], n[2], n[1]}), .e(1'b1), .o(Disp[4]));
    m8_le FMux(.in({1'b0, n[0],1'b0,1'b0,n[0],1'b0,1'b1,n[0]}), .sel({n[3], n[2], n[1]}), .e(1'b1), .o(Disp[5]));
    m8_le GMux(.in({1'b0,Inverse,1'b0,1'b0,n[0],1'b0,1'b0,1'b1}), .sel({n[3], n[2], n[1]}), .e(1'b1), .o(Disp[6]));
    

    
endmodule


module m8_le(

input [7:0] in,
input [2:0] sel,
input e,
output o
    );
    assign o = (in[0] & ~sel[2] & ~sel[1] & ~sel[0])|
                (in[1] & ~sel[2] & ~sel[1] & sel[0])|
                (in[2] & ~sel[2] & sel[1] & ~sel[0])|
                (in[3] & ~sel[2] & sel[1] & sel[0])|
                (in[4] & sel[2] & ~sel[1] & ~sel[0])|
                (in[5] & sel[2] & ~sel[1] & sel[0])|
                (in[6] & sel[2] & sel[1] & ~sel[0])|
                (in[7] & sel[2] & sel[1] & sel[0]);
endmodule

