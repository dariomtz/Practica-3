`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESO 
// Engineer:  dariomtz
//////////////////////////////////////////////////////////////////////////////////
module mux(
        input clk, 
        input [3:0] n1,
        input [3:0] n2,
        input [3:0] n3,
        input [3:0] n4,
        output [3:0] pos,
        output [6:0] dout
    );
	
    reg [19:0] c;
    reg [2:0] counter;

    always @ (posedge clk) begin

        if (c == 833333) begin
            case (counter)
                3: counter <= 0;
                default: counter <= counter + 1;
            endcase
            
        end else begin
            c <= c + 1;
        end
        
    end
	
    assign pos =    (counter == 0) ? 4'b1110:
                    (counter == 1) ? 4'b1101:
                    (counter == 2) ? 4'b1011:
                                     4'b0111;

    wire currentNum;
    assign currentNum = (counter == 0) ? n1 : 
                        (counter == 1) ? n2 :
                        (counter == 2) ? n3 :
                                         n4 ;
    
    display d(.n(currentNum[3:0]), .d(dout[6:0]));
endmodule