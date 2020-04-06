`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO 
// Engineer:  dariomtz
//////////////////////////////////////////////////////////////////////////////////
module top(
        input clk,
        input reset,
        input enable,
        output [6:0] disp,
        output [1:0] mux,
    );

    wire [3:0] tenthsSec;
    wire [3:0] unitsSec;
    wire [3:0] tensSec;
    wire [3:0] min;

    //module        input                   output
    tenthsCouter    a(.clk(clk),            .out(tenthsCouter));
    unitsCouter     b(.clk(tenthsCouter),   .out(unitsSec));
    tensCouter      c(.clk(unitsSec),       .out(tensSec));
    minsCouter      d(.clk(tensSec),        .out(min));

    wire [6:0] displayTenths;
    wire [6:0] displayUnits;
    wire [6:0] displayTens;
    wire [6:0] displayMins;

    display d1(.n(tenthsSec),   .d(displayTenths));
    display d1(.n(unitsSec),    .d(displayUnits));
    display d1(.n(tensSec),     .d(displayTens));
    display d1(.n(min),         .d(displayMins));

    mux m(.clk(clk), .dout(disp), .pos(mux),
                    .d1(displayTenths),
                    .d2(displayUnits), 
                    .d3(displayTens), 
                    .d4(displayMins)
                    );

    display d(.n(num), .d(disp));
                      
endmodule