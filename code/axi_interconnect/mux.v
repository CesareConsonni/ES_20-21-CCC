`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.12.2020 09:24:05
// Design Name: 
// Module Name: mux
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


module mux
        #(parameter
            A_LEN = 1,
            B_LEN = 1,
            C_LEN = 1,
            D_LEN = 1
        )
        (
            sel,
            a_out, b_out, c_out, d_out,
            a_00, b_00, c_00, d_00,
            a_01, b_01, c_01, d_01,
            a_02, b_02, c_02, d_02,
            a_03, b_03, c_03, d_03,
            a_04, b_04, c_04, d_04,
            a_05, b_05, c_05, d_05
        );
    
    input [2:0] sel;
    input [A_LEN - 1: 0] a_00, a_01, a_02, a_03, a_04, a_05;
    input [B_LEN - 1: 0] b_00, b_01, b_02, b_03, b_04, b_05;
    input [C_LEN - 1: 0] c_00, c_01, c_02, c_03, c_04, c_05;
    input [D_LEN - 1: 0] d_00, d_01, d_02, d_03, d_04, d_05;
    
    output reg [A_LEN - 1: 0] a_out;
    output reg [B_LEN - 1: 0] b_out;
    output reg [C_LEN - 1: 0] c_out;
    output reg [D_LEN - 1: 0] d_out;
    
    localparam  s00 = 3'b000,
                s01 = 3'b001,
                s02 = 3'b010,
                s03 = 3'b011,
                s04 = 3'b100,
                s05 = 3'b101,
                s_err = 3'b110;
                
    always@(
            sel,
            a_00, b_00, c_00, d_00,
            a_01, b_01, c_01, d_01,
            a_02, b_02, c_02, d_02,
            a_03, b_03, c_03, d_03,
            a_04, b_04, c_04, d_04,
            a_05, b_05, c_05, d_05
            )
    begin
    
    case (sel)
        s00:
        begin
            a_out = a_00;
            b_out = b_00;
            c_out = c_00;
            d_out = d_00;
        end
        
        s01:
        begin
            a_out = a_01;
            b_out = b_01;
            c_out = c_01;
            d_out = d_01;
        end
        
        s02:
        begin
            a_out = a_02;
            b_out = b_02;
            c_out = c_02;
            d_out = d_02;
        end
        
        s03:
        begin
            a_out = a_03;
            b_out = b_03;
            c_out = c_03;
            d_out = d_03;
        end
        
        s04:
        begin
            a_out = a_04;
            b_out = b_04;
            c_out = c_04;
            d_out = d_04;
        end

        s05:
        begin
            a_out = a_05;
            b_out = b_05;
            c_out = c_05;
            d_out = d_05;
        end
        
        s_err:
        begin            
            a_out = ~0;
            b_out = ~0;
            c_out = ~0;
            d_out = ~0;
        end
        
        default:
        begin
            a_out = 0;
            b_out = 0;
            c_out = 0;
            d_out = 0;
        end
        
    endcase
    
    end //end always
    
endmodule
