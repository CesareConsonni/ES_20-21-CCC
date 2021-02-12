`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.12.2020 10:54:51
// Design Name: 
// Module Name: demuxer
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


module demuxer # 
            (parameter W = 1)
            (sel, a, b, c, d, e, f, in);
            
    input [2:0] sel;
    output reg [W-1:0] a; 
    output reg [W-1:0] b;
    output reg [W-1:0] c;
    output reg [W-1:0] d;
    output reg [W-1:0] e;
    output reg [W-1:0] f;
    input [W-1:0] in;

    always@ (*)
        begin
        
            a = {W{'b0}};
            b = {W{'b0}};
            c = {W{'b0}};
            d = {W{'b0}};
            e = {W{'b0}};
            f = {W{'b0}};
        
            case(sel)
                3'b000: a = in;
                3'b001: b = in;
                3'b010: c = in;
                3'b011: d = in;
                3'b100: e = in;
                3'b101: f = in;
            endcase
        end

endmodule
