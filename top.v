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

    wire [6:0] units;
    wire [6:0] tens;
    wire [6:0] hundreds;
    wire [6:0] thousends;

    display d1(.n(num),   .d(units));
    display d2(.n(0),    .d(tens));
    display d3(.n(0),     .d(hundreds));
    display d4(.n(0),         .d(thousends));

    mux m(.clk(clk), .dout(disp), .pos(mux),
                    .d1(units),
                    .d2(tens), 
                    .d3(hundreds), 
                    .d4(thousends)
                    );
                      
endmodule