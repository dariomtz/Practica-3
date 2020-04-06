`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO 
// Engineer:  dariomtz
//////////////////////////////////////////////////////////////////////////////////
module top(
        input clk,
        output [6:0] disp,
        output [3:0] mux
    );

    wire num;

    counter c(.clk(clk), .out(num));

    mux m(.clk(clk), .dout(disp), .pos(mux),
                    .n1(num),
                    .n2(12), 
                    .n3(11), 
                    .n4(10)
                    );
                      
endmodule