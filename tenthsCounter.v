`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO 
// Engineer:  dariomtz
//////////////////////////////////////////////////////////////////////////////////
module tenthsCounter(
        input clk,
        input reset,
        input pp,
        output reg [3:0] out
    );

    reg [22 : 0] counter;
    reg play;

    always @ (posedge clk or posedge reset or posedge pp) begin

        if (pp) begin
            play <= play + 1;
            
        end else begin

            if (reset) begin
                counter <= 0;
                out <= 0;

            end else begin

                if (play) begin
                    counter <= counter + 1;

                    if (counter == 5_000_000) begin
                        counter <= 0;
                        
                        if (out == 9) begin
                            out <= 0;

                        end else begin
                            out <= out + 1;
                        end

                    end

                end
                
            end

        end
            
    end
                      
endmodule