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
	
    reg [2:0] counter;

    always @ (posedge clk) begin

        case (mux)
            3: counter <= 0;
            default: counter <= counter + 1;
        endcase

    end
	
    assign pos =    (counter == 0) ? 4'b1110:
                    (counter == 1) ? 4'b1101:
                    (counter == 2) ? 4'b1011:
                                     4'b0111;

    assign dout =   (counter == 0) ? d1 : 
                    (counter == 1) ? d2 :
                    (counter == 2) ? d3 :
                                     d4 ;   
                      
endmodule