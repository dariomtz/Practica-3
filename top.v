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
        output [3:0] mux
    );

<<<<<<< HEAD
    wire [3:0] tenthsSec;
    wire [3:0] unitsSec;
    wire [3:0] tensSec;
    wire [3:0] min;
=======
    wire num;
>>>>>>> parent of de70ff4... corrections

    //module        input                   output               reset          enable
    tenthsCounter    a(.clk(clk),           .out(tenthsSec), .reset(reset),  .enable(enable));
    unitsCounter     b(.clk(tenthsSec),       .out(unitsSec),     .reset(reset));
    tensCounter      c(.clk(unitsSec),      .out(tensSec),      .reset(reset));
    minsCounter      d(.clk(tensSec),       .out(min),          .reset(reset));

    wire [6:0] displayTenths;
    wire [6:0] displayUnits;
    wire [6:0] displayTens;
    wire [6:0] displayMins;

    display d1(.n(tenthsSec),   .d(displayTenths));
    display d2(.n(unitsSec),    .d(displayUnits));
    display d3(.n(tensSec),     .d(displayTens));
    display d4(.n(min),         .d(displayMins));

    mux m(.clk(clk), .dout(disp), .pos(mux),
                    .d1(displayTenths),
                    .d2(displayUnits), 
                    .d3(displayTens), 
                    .d4(displayMins)
                    );
                      
endmodule