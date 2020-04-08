`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO 
// Engineer:  dariomtz
//////////////////////////////////////////////////////////////////////////////////
module tenthsCounter(
        input clk,
        input reset,
        output reg [3:0] out
    );

    reg [22 : 0] counter;

    always @ (posedge clk or negedge reset) begin

        if (reset) begin
            counter <= 0;
            out <= 0;

        end else begin
            counter <= counter + 1;
            if (counter == 2_500_000) begin
                counter <= 0;
                
                if (out == 9) begin
                    out <= 0;

                end else begin
                    out <= out + 1;
                end

            end

        end
            
    end
                      
endmodule