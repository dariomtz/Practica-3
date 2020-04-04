`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO 
// Engineer:  dariomtz
//////////////////////////////////////////////////////////////////////////////////
module mux(
        input clk, 
        input [6:0] d1,
        input [6:0] d2,
        input [6:0] d3,
        input [6:0] d4,
        output [3:0] pos,
        output [6:0] dout
    );
	
    reg [19 : 0] counter;
    reg [3:0] mux;

    always @ (posedge clk) begin

        counter <= counter + 1;

        if (counter == 833_333) begin
            counter <= 0;

            case (mux)
                4'b1110: mux <= 4'b1101;
                4'b1101: mux <= 4'b1011;
                4'b1011: mux <= 4'b0111;
                4'b0111: mux <= 4'b1110;
                default: mux <= 4'b0000;
            endcase

        end

    end
	
    assign pos = mux;

    assign dout =   (mux == 4'b1110) ? d1 :
                    (mux == 4'b1101) ? d2 : 
                    (mux == 4'b1011) ? d3 :
                                       d4 ;
                      
endmodule