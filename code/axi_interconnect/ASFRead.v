`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.12.2020 11:01:07
// Design Name: 
// Module Name: ASFRead
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RrstFSM(
    input AxVALID,
    input AxREADY,
    input xVALID,
    input xREADY,
    input decerr,
    input clk,
    input rst,
    output reg decoderrst
    );
    reg [2:0] ss, ss_next;
    localparam IDLE=3'b000, AHS=3'b001, DHS=3'b010, ERRD=3'b011, RST=3'b111;
    always@(posedge clk)
        begin
            if(rst) ss<=RST;
            else ss<=ss_next;
        end
    always@(AxVALID, AxREADY, xVALID, xREADY, ss, decerr)
        begin
            ss_next=ss;
            decoderrst=0;
            case(ss)
                RST:    begin
                                ss_next=IDLE;
                                decoderrst=1;
                        end
                IDLE:   begin
                            if(AxVALID && AxREADY && (decerr == 0) )
                                begin
                                if(xVALID && xREADY) ss_next = DHS;
                                else ss_next=AHS;
                                end
                            if(xREADY && decerr) ss_next = ERRD; 
                        end
                AHS:   begin
                            if(xVALID && xREADY) ss_next=DHS;
                        end
                DHS:   begin
                            if (xVALID == 0)
                                begin
                                    ss_next=IDLE;
                                    decoderrst=1;
                                end
                        end
                ERRD:   begin
                
                                ss_next=IDLE;
                                decoderrst=1;
                        end
            endcase                                                                           
        end
endmodule
