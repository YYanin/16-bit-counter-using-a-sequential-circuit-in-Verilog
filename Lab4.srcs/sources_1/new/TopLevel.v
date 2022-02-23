`timescale 1ns / 1ps


module TopLevel(
    input clkin,
    input btnR,
    input btnU,
    input btnD,
    input btnC,
    input btnL,
    input [15:0] sw,
    
    output [6:0] seg,
    output dp,          //
    output [3:0] an,    //
    output [15:0] led
    

    );
    

    
    
    
    
    wire W1, W2, W3;
    
    wire clk;
    wire [15:0] Q;
    wire [15:0]W5;    //For N in Selector
    //ButtonC and edgeDetector
    assign W1 = (~(&W5[15:2]))&btnC;
    EdgeDetector UandC (.clk(clk), .Ce(btnU), .Out(W2));
    
    assign W3 = W1|W2;  //Up val in 16 bit
    
    wire W4;
    EdgeDetector D (.clk(clk), .Ce(btnD), .Out(W4));  //Dw val in 16 bit
    
    
    wire T1, T2;
    counterUD16L TheBigOne (.clkin(clk), .Dw(W4),.LD(btnL), .Up(W3), .Din(sw), 
    .UTC(T1), .DTC(T2), .Q(W5));
    
    wire [3:0] W6;      //For sel in selector
    
    
    wire [3:0] W7; //Hex input
    Selector sssshhh (.sel(W6), .N(W5), .H(W7));
    wire extra;
    hex7seg Display (.n(W7), .e(1'b1), .Disp(seg));
    wire digsel;
    //Lab4_clks
        assign an = ~W6;

    lab4_clks slowit (.clkin(clkin), .greset(btnR), .clk(clk), .digsel(digsel));
    RingCounter ring (.clk(clk), .advance(digsel), .Q(W6));
    
    
    //LED
    assign led = sw;
    
    //Decimal
    assign dp = ~(((T1)& ~an[3])|((T2)& ~an[0]));
    
    
    
    
endmodule

    