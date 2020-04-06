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

    wire [3:0] decisecond;
    wire [3:0] second;
    wire [3:0] tenseconds;
    wire [3:0] hundredseconds;

    tenthsCounter c1(.clk(clk), .out(decisecond));
    tenthsCounter c2(.clk(decisecond[0]), .out(second));
    tenthsCounter c3(.clk(second[0]), .out(tenseconds));
    tenthsCounter c4(.clk(tenseconds[0]), .out(hundredseconds));

    mux m(.clk(clk), .dout(disp), .pos(mux),
                    .n1(decisecond),
                    .n2(second), 
                    .n3(tenseconds), 
                    .n4(hundredseconds));
                      
endmodule