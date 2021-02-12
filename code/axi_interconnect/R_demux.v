`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.12.2020 11:54:53
// Design Name: 
// Module Name: R_demux
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


module R_demux
        #(parameter
            A_LEN = 1,
            B_LEN = 1,
            C_LEN = 1,
            D_LEN = 1
        )
        (
            sel,
            a_in, b_in, c_in, d_in,
            a_00_o, b_00_o, c_00_o, d_00_o,
            a_01_o, b_01_o, c_01_o, d_01_o,
            a_02_o, b_02_o, c_02_o, d_02_o,
            a_03_o, b_03_o, c_03_o, d_03_o,
            a_04_o, b_04_o, c_04_o, d_04_o,
            a_05_o, b_05_o, c_05_o, d_05_o
        );
    
    input [2:0] sel;    
    input [A_LEN - 1: 0] a_in;
    input [B_LEN - 1: 0] b_in;
    input [C_LEN - 1: 0] c_in;
    input [D_LEN - 1: 0] d_in;
    
    output reg [A_LEN - 1: 0] a_00_o, a_01_o, a_02_o, a_03_o, a_04_o, a_05_o;
    output reg [B_LEN - 1: 0] b_00_o, b_01_o, b_02_o, b_03_o, b_04_o, b_05_o;
    output reg [C_LEN - 1: 0] c_00_o, c_01_o, c_02_o, c_03_o, c_04_o, c_05_o;
    output reg [D_LEN - 1: 0] d_00_o, d_01_o, d_02_o, d_03_o, d_04_o, d_05_o;
   
    localparam  s00 = 3'b000,
                s01 = 3'b001,
                s02 = 3'b010,
                s03 = 3'b011,
                s04 = 3'b100,
                s05 = 3'b101;
                
    always@(
            sel,
            a_in, b_in, c_in, d_in
            )
    begin
    
    // default output
    a_00_o = 0;
    b_00_o = 0;
    c_00_o = 0;
    d_00_o = 0;
    
    a_01_o = 0;
    b_01_o = 0;
    c_01_o = 0;
    d_01_o = 0;
    
    a_02_o = 0;
    b_02_o = 0;
    c_02_o = 0;
    d_02_o = 0;
    
    a_03_o = 0;
    b_03_o = 0;
    c_03_o = 0;
    d_03_o = 0;
    
    a_04_o = 0;
    b_04_o = 0;
    c_04_o = 0;
    d_04_o = 0;
    
    a_05_o = 0;
    b_05_o = 0;
    c_05_o = 0;
    d_05_o = 0;

    case (sel)
        s00:
        begin
            a_00_o = a_in;
            b_00_o = b_in;
            c_00_o = c_in;
            d_00_o = d_in;
        end
        
        s01:
        begin
            a_01_o = a_in;
            b_01_o = b_in;
            c_01_o = c_in;
            d_01_o = d_in;
        end
        
        s02:
        begin
            a_02_o = a_in;
            b_02_o = b_in;
            c_02_o = c_in;
            d_02_o = d_in;
        end
        
        s03:
        begin
            a_03_o = a_in;
            b_03_o = b_in;
            c_03_o = c_in;
            d_03_o = d_in;
        end
        
        s04:
        begin
            a_04_o = a_in;
            b_04_o = b_in;
            c_04_o = c_in;
            d_04_o = d_in;
        end
        
        s05:
        begin
            a_05_o = a_in;
            b_05_o = b_in;
            c_05_o = c_in;
            d_05_o = d_in;
        end
        
    endcase
    
    end //end always
    
endmodule
