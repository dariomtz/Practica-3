`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO 
// Engineer:  dariomtz
//////////////////////////////////////////////////////////////////////////////////
module counter(
        input clk,
        output [3:0] out
    );
	 
	 reg [3:0] num;

    always @ (posedge clk)
    begin
        if (num == 9) begin
            num <= 0;
        end
        else begin
            num <= num + 1;
        end
    end
	 assign out = num;
                      
endmodule