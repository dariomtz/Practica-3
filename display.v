`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO 
// Engineer:  dariomtz
//////////////////////////////////////////////////////////////////////////////////
module display(
        input [3:0] n,
        output [6:0] d
    );

    wire w = n[0];
    wire X = n[1];
    wire y = n[2];
    wire z = n[3];

    assign d[0] = ~z & ~X & (y ^ w) | z & w & (y ^X);
    assign d[1] = y & (z & (X | ~w) | ~z & (X ^ y)) | z & ~y & X & w;
    assign d[2] = z & y & (X | ~w) | ~(z | y | ~X | w);
    assign d[3] = ~z & ~X & (y ^ w) | X & (y & w | z & ~y & ~w);
    assign d[4] = ~z & w | ~X (~z & y & ~w | z & ~y & w);
    assign d[5] = ~z & ~y & (X | w) | y & w & (z ^ X);
    assign d[6] = ~(z | y | X) | y & (~z & X & w | z & ~X & ~w);
                      
endmodule