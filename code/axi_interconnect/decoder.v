`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.12.2020 10:40:47
// Design Name: 
// Module Name: decoder
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

`define ADDR 32

module decoder #(
    parameter [`ADDR-1:0] LOW0 = 32'b0100_0000_0001_0000_0000_0000_0000_0000,
    parameter [`ADDR-1:0] HIG0 = 32'b0100_0000_0001_0000_1111_1111_1111_1111,
    parameter [`ADDR-1:0] LOW1 = 32'b0100_0000_0001_0001_0000_0000_0000_0000,
    parameter [`ADDR-1:0] HIG1 = 32'b0100_0000_0001_0001_1111_1111_1111_1111,
    parameter [`ADDR-1:0] LOW2 = 32'b0100_0000_0001_0010_0000_0000_0000_0000,
    parameter [`ADDR-1:0] HIG2 = 32'b0100_0000_0001_0010_1111_1111_1111_1111,
    parameter [`ADDR-1:0] LOW3 = 32'b0110_0000_0000_0000_0000_0000_0000_0000,
    parameter [`ADDR-1:0] HIG3 = 32'b0110_0000_0000_0000_0001_1111_1111_1111,
    parameter [`ADDR-1:0] LOW4 = 32'b0100_0000_0001_0011_0000_0000_0000_0000,
    parameter [`ADDR-1:0] HIG4 = 32'b0100_0000_0001_0011_1111_1111_1111_1111,
    parameter [`ADDR-1:0] LOW5 = 32'b0100_0000_0000_0000_0000_0000_0000_0000,
    parameter [`ADDR-1:0] HIG5 = 32'b0100_0000_0000_0011_1111_1111_1111_1111
     )(
    input [31:0] AxADDR,
    input AxVALID,
    input rst,
    output [2:0] cntrl,
    output reg error
    );
    reg [2:0] out;
    always@(rst, AxVALID)
        begin
            error = 0;
            if (rst==1'b1) out=3'b111;
            else 
            if(AxVALID==1'b1)
                if(AxADDR>=LOW0 && AxADDR<=HIG0)
                    out=3'b000;            
                else if(AxADDR>=LOW1 && AxADDR<=HIG1)
                    out=3'b001;
                else if(AxADDR>=LOW2 && AxADDR<=HIG2)
                    out=3'b010;
                else if(AxADDR>=LOW3 && AxADDR<=HIG3)
                    out=3'b011; 
                else if(AxADDR>=LOW4 && AxADDR<=HIG4)
                    out=3'b100;
                else if(AxADDR>=LOW5 && AxADDR<=HIG5)
                    out=3'b101;
                else
                    begin
                    out=3'b110;
                    error = 1;
                    end
        end   
    assign cntrl = out; 
endmodule