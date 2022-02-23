`timescale 1ns / 1ps


module Verilog_Testbench();

    reg clkin,btnR,btnU, btnD, btnC, btnL;
    reg [15:0] sw;
    wire [5:0] seg; 
    wire [3:0] an;
    wire [15:0] led;
    
    
    TopLevel UUT (
        .clkin(clkin), .btnR(btnR), .btnU(btnU), .btnD(btnD), .btnC(btnC), .btnL(btnL),
        .seg(seg), .sw(sw)
      
    );
    
    parameter PERIOD = 10;
    parameter real DUTY_CYCLE = 0.5;
    parameter OFFSET = 2;

    initial    // Clock process for clkin
    begin
        #OFFSET
		  clkin = 1'b1;
        forever
        begin
            #(PERIOD-(PERIOD*DUTY_CYCLE)) clkin = ~clkin;
        end
	end
	
   initial
   
   begin
   

   sw[0] = 1'b1;
   sw[1] = 1'b1;
   sw[2] = 1'b0;
   sw[3] = 1'b0;
   sw[4] = 1'b0;
   sw[5] = 1'b0;
   sw[6] = 1'b0;
   sw[7] = 1'b0;
   sw[8] = 1'b0;
   sw[9] = 1'b0;
   sw[10] = 1'b0;
   sw[11] = 1'b0;
   sw[12] = 1'b0;
   sw[13] = 1'b0;
   sw[14] = 1'b0;
   sw[15] = 1'b0;
   clkin = 1'b0;
   btnR = 1'b0;
   btnU = 1'b0;
   btnD = 1'b0;
   btnC = 1'b0;
   btnL = 1'b0;
   
   #1100;
   btnC = 1'b1;
   
   
   #100;
   
   #100;
   btnC = 1'b0;
   btnU = 1'b1;
   #100;
   
   #100;
   
   #100;
   
   
   #100;
   btnU = 1'b1;
   btnR = 1'b1;  
   #100;
   
   #100;
   
   #100;  
   
   
   #100;
   
   #100;
   btnR = 1'b0;
   btnD = 1'b1;
   #100;
   
   
   #100;
   #100;
   btnD = 1'b0;
   btnL = 1'b1;
   #100;
   
   #100;
   
   
   #100;
  btnL = 1'b0;
   sw[4] = 1'b1;
   sw[5] = 1'b1;
   sw[6] = 1'b1;
   sw[7] = 1'b1;
   sw[8] = 1'b1;
      btnC = 1'b1;
   
   
   #100;
   
   #100;
   btnC = 1'b0;
   btnU = 1'b1;
   #100;
   
   #100;
   
   #100;
   
   
   #100;
   btnU = 1'b1;
   btnR = 1'b1;  
   #100;
   
   #100;
   
   #100;  
   
   
   #100;
   
   #100;
   btnR = 1'b0;
   btnD = 1'b1;
   #100;
   
   
   #100;
   #100;
   btnD = 1'b0;
   btnL = 1'b1;
   #100;
   
   #100;
   
   
   #100;
  btnL = 1'b0;
   
   
   
   
   end
endmodule
