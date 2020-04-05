`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO 
// Engineer:  dariomtz
//////////////////////////////////////////////////////////////////////////////////
module counter(
        input clk,
        output reg out
    );

    always @ (posedge clk)
    begin
        if (out == 9) begin
            out <= 0;
        end
        else begin
            out <= out + 1;
        end
    end
                      
endmodule