`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO 
// Engineer:  dariomtz
//////////////////////////////////////////////////////////////////////////////////
module unitsCounter(
        input clk, 
        input reset, 
        output [3:0] out
    );
	
    reg [3 : 0] counter;
	reg [3:0] num;

    always @ (posedge clk, negedge clk, posedge reset) begin

        if (reset) begin
            counter <= 0;
            num <= 0;

        end else begin

            if (counter == 10) begin
                counter <= 0;

                case (num)
                    9: num <= 0; 
                    default: num <= num + 1;
                endcase

            end else begin
                counter <= counter + 1;
            end

        end

    end
	
    assign out = num;
                      
endmodule