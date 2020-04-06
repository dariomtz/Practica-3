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
    reg play;

    always @ (posedge clk or posedge reset or posedge enable) begin

        if (enable) begin
            case (play)
                0: play <= 1;
                1: play <= 0; 
            endcase

        end else begin

            if (reset) begin
                counter <= 0;
                num <= 0;
                    
            end else begin

                if (play) begin
                    
                    if (counter == 5_000_000) begin
                        counter <= 0;

                        if (num == 9) begin
                            num <= 0;

                        end else begin
                            num <= num + 1;
                        end

                    end else begin
                        counter <= counter + 1;
                    end

                end

            end

        end

    end
	
    assign out = num;
                      
endmodule