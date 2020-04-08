`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO 
// Engineer:  dariomtz
//////////////////////////////////////////////////////////////////////////////////
module top(
        input clk,
        input reset,
        input pp,
        output [6:0] disp,
        output [3:0] mux,
        output dots
    );

    wire [3:0] decisecond;
    wire [3:0] second;
    wire [3:0] tenseconds;
    wire [3:0] hundredseconds;

    //output        clock                   output                  reset       
    tenthsCounter c1(.clk(clk),             .out(decisecond)        ,.reset(reset), .pp(pp));
    unitsCounter  c2(.clk(decisecond[0]),   .out(second)            ,.reset(reset));
    tensCounter   c3(.clk(second[0]),       .out(tenseconds)        ,.reset(reset));
    minsCounter   c4(.clk(tenseconds[0]),   .out(hundredseconds)    ,.reset(reset));

    mux m(.clk(clk), .dout(disp), .pos(mux),
                    .n1(decisecond),
                    .n2(second), 
                    .n3(tenseconds), 
                    .n4(hundredseconds));
    
    assign dots = (mux == 4'b0111 | mux == 4'b1101) ? 0 : 1;
                      
endmodule