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
    wire x = n[1];
    wire y = n[2];
    wire z = n[3];

    assign d[0] = ~z & ~x & (y ^ w) | z & w & (y ^x);
    assign d[1] = y & (z & (x | ~w) | ~z & (x ^ y)) | z & ~y & x & w;
    assign d[2] = z & y & (x | ~w) | ~(z | y | ~x | w);
    assign d[3] = ~z & ~x & (y ^ w) | x & (y & w | z & ~y & ~w);
    assign d[4] = ~z & w | ~x (~z & y & ~w | z & ~y & w);
    assign d[5] = ~z & ~y & (x | w) | y & w & (z ^ x);
    assign d[6] = ~(z | y | x) | y & (~z & x & w | z & ~x & ~w);
                      
endmodule