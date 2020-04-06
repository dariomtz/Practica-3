`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO 
// Engineer:  dariomtz
//////////////////////////////////////////////////////////////////////////////////
module tenthsCounter(
        input clk, 
        input reset, 
        input enable,
        output [3:0] out
    );
	
    reg [22 : 0] counter;
	reg [3:0] num;
    reg play = 1;

    always @ (posedge clk, posedge reset, posedge enable) begin

        if (enable) begin
            play <= ~play;
        end

        if (reset) begin
            counter <= 0;
            num <= 0;
                  
        end else begin

            if (play) begin
                counter <= counter + 1;

                if (counter == 5_000_000) begin
                    counter <= 0;

                    if () begin
                        num <= 0;

                    end else begin
                        num <= num + 1;
                    end

                end

            end

        end

    end
	
    assign out = num;
                      
endmodule