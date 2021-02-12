`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.12.2020 10:54:21
// Design Name: 
// Module Name: fake_AXI_int
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


module AXI_connect
    #( parameter
                ADDR = 32,
                VALID = 1,
                PROT = 3,
                DATA = 32,
                STRB = 4,
                READY = 1,
                RESP = 2
    )

    ( clk, rst,
    // master and slave input
    M00_AWADDR, M00_ARADDR, M00_AWVALID, M00_WVALID, M00_ARVALID, M00_AWPROT, M00_ARPROT, M00_WDATA, M00_WSTRB, M00_BREADY, M00_RREADY,
    S00_BVALID, S00_RVALID, S00_RDATA, S00_AWREADY, S00_WREADY, S00_ARREADY, S00_BRESP, S00_RRESP,
    S01_BVALID, S01_RVALID, S01_RDATA, S01_AWREADY, S01_WREADY, S01_ARREADY, S01_BRESP, S01_RRESP,
    S02_BVALID, S02_RVALID, S02_RDATA, S02_AWREADY, S02_WREADY, S02_ARREADY, S02_BRESP, S02_RRESP,
    S03_BVALID, S03_RVALID, S03_RDATA, S03_AWREADY, S03_WREADY, S03_ARREADY, S03_BRESP, S03_RRESP,
    S04_BVALID, S04_RVALID, S04_RDATA, S04_AWREADY, S04_WREADY, S04_ARREADY, S04_BRESP, S04_RRESP,
    S05_BVALID, S05_RVALID, S05_RDATA, S05_AWREADY, S05_WREADY, S05_ARREADY, S05_BRESP, S05_RRESP,
    //slaves and master output    
    S00_AWADDR, S00_ARADDR, S00_AWVALID, S00_WVALID, S00_ARVALID, S00_AWPROT, S00_ARPROT, S00_WDATA, S00_WSTRB, S00_BREADY, S00_RREADY,
    S01_AWADDR, S01_ARADDR, S01_AWVALID, S01_WVALID, S01_ARVALID, S01_AWPROT, S01_ARPROT, S01_WDATA, S01_WSTRB, S01_BREADY, S01_RREADY,
    S02_AWADDR, S02_ARADDR, S02_AWVALID, S02_WVALID, S02_ARVALID, S02_AWPROT, S02_ARPROT, S02_WDATA, S02_WSTRB, S02_BREADY, S02_RREADY,
    S03_AWADDR, S03_ARADDR, S03_AWVALID, S03_WVALID, S03_ARVALID, S03_AWPROT, S03_ARPROT, S03_WDATA, S03_WSTRB, S03_BREADY, S03_RREADY,
    S04_AWADDR, S04_ARADDR, S04_AWVALID, S04_WVALID, S04_ARVALID, S04_AWPROT, S04_ARPROT, S04_WDATA, S04_WSTRB, S04_BREADY, S04_RREADY,
    S05_AWADDR, S05_ARADDR, S05_AWVALID, S05_WVALID, S05_ARVALID, S05_AWPROT, S05_ARPROT, S05_WDATA, S05_WSTRB, S05_BREADY, S05_RREADY,
    M00_BVALID, M00_RVALID, M00_RDATA, M00_AWREADY, M00_WREADY, M00_ARREADY, M00_BRESP, M00_RRESP
    );
    
    input clk, rst;
    
    // input from master 00
    input [ADDR - 1: 0]   M00_AWADDR,                                  M00_ARADDR;
    input [VALID - 1: 0]  M00_AWVALID, M00_WVALID,                  M00_ARVALID;
    input [PROT - 1: 0]   M00_AWPROT,                                  M00_ARPROT;
    input [DATA - 1: 0]                   M00_WDATA;
    input [STRB - 1: 0]                   M00_WSTRB;
    input [READY - 1: 0]                                  M00_BREADY,                  M00_RREADY;
    
    // input from slave 00
    input [VALID - 1: 0]                                  S00_BVALID,                  S00_RVALID;
    input [DATA - 1: 0]                                                                   S00_RDATA;
    input [READY - 1: 0]  S00_AWREADY, S00_WREADY,                  S00_ARREADY;
    input [RESP - 1: 0]                                   S00_BRESP,                   S00_RRESP;
    
    
    // input from slave 01
    input [VALID - 1: 0]                               S01_BVALID,                  S01_RVALID;
    input [DATA - 1: 0]                                                                   S01_RDATA;
    input [READY - 1: 0]  S01_AWREADY, S01_WREADY,                  S01_ARREADY;
    input [RESP - 1: 0]                                   S01_BRESP,                   S01_RRESP;
    

    // input from slave 02
    input [VALID - 1: 0]                                  S02_BVALID,                  S02_RVALID;
    input [DATA - 1: 0]                                                                   S02_RDATA;
    input [READY - 1: 0]  S02_AWREADY, S02_WREADY,                  S02_ARREADY;
    input [RESP - 1: 0]                                   S02_BRESP,                   S02_RRESP;
    
    // input from slave 03
    input [VALID - 1: 0]                                  S03_BVALID,                  S03_RVALID;
    input [DATA - 1: 0]                                                                   S03_RDATA;
    input [READY - 1: 0]  S03_AWREADY, S03_WREADY,                  S03_ARREADY;
    input [RESP - 1: 0]                                   S03_BRESP,                   S03_RRESP;
    
    // input from slave 04
    input [VALID - 1: 0]                                  S04_BVALID,                  S04_RVALID;
    input [DATA - 1: 0]                                                                   S04_RDATA;
    input [READY - 1: 0]  S04_AWREADY, S04_WREADY,                  S04_ARREADY;
    input [RESP - 1: 0]                                   S04_BRESP,                   S04_RRESP;

    // input from slave 05
    input [VALID - 1: 0]                                  S05_BVALID,                  S05_RVALID;
    input [DATA - 1: 0]                                                                   S05_RDATA;
    input [READY - 1: 0]  S05_AWREADY, S05_WREADY,                  S05_ARREADY;
    input [RESP - 1: 0]                                   S05_BRESP,                   S05_RRESP;
    
    // output to slave 00  
    output [ADDR - 1: 0]   S00_AWADDR,                                 S00_ARADDR;
    output [VALID - 1: 0]  S00_AWVALID, S00_WVALID,                 S00_ARVALID;
    output [PROT - 1: 0]   S00_AWPROT,                                 S00_ARPROT;
    output [DATA - 1: 0]                   S00_WDATA;
    output [STRB - 1: 0]                   S00_WSTRB;
    output [READY - 1: 0]                                  S00_BREADY,   S00_RREADY;

    // output to slave 01  
    output [ADDR - 1: 0]   S01_AWADDR,                                 S01_ARADDR;
    output [VALID - 1: 0]  S01_AWVALID, S01_WVALID,                 S01_ARVALID;
    output [PROT - 1: 0]   S01_AWPROT,                                 S01_ARPROT;
    output [DATA - 1: 0]                   S01_WDATA;
    output [STRB - 1: 0]                   S01_WSTRB;
    output [READY - 1: 0]                                  S01_BREADY,                 S01_RREADY;

    // output to slave 02  
    output [ADDR - 1: 0]   S02_AWADDR,                                 S02_ARADDR;
    output [VALID - 1: 0]  S02_AWVALID, S02_WVALID,                 S02_ARVALID;
    output [PROT - 1: 0]   S02_AWPROT,                                 S02_ARPROT;
    output [DATA - 1: 0]                   S02_WDATA;
    output [STRB - 1: 0]                   S02_WSTRB;
    output [READY - 1: 0]                                  S02_BREADY,                 S02_RREADY;

    // output to slave 03  
    output [ADDR - 1: 0]   S03_AWADDR,                                 S03_ARADDR;
    output [VALID - 1: 0]  S03_AWVALID, S03_WVALID,                 S03_ARVALID;
    output [PROT - 1: 0]   S03_AWPROT,                                 S03_ARPROT;
    output [DATA - 1: 0]                   S03_WDATA;
    output [STRB - 1: 0]                   S03_WSTRB;
    output [READY - 1: 0]                                  S03_BREADY,                 S03_RREADY;

    // output to slave 04  
    output [ADDR - 1: 0]   S04_AWADDR,                                 S04_ARADDR;
    output [VALID - 1: 0]  S04_AWVALID, S04_WVALID,                 S04_ARVALID;
    output [PROT - 1: 0]   S04_AWPROT,                                 S04_ARPROT;
    output [DATA - 1: 0]                   S04_WDATA;
    output [STRB - 1: 0]                   S04_WSTRB;
    output [READY - 1: 0]                                  S04_BREADY,                 S04_RREADY;

    // output to slave 05  
    output [ADDR - 1: 0]   S05_AWADDR,                                 S05_ARADDR;
    output [VALID - 1: 0]  S05_AWVALID, S05_WVALID,                 S05_ARVALID;
    output [PROT - 1: 0]   S05_AWPROT,                                 S05_ARPROT;
    output [DATA - 1: 0]                   S05_WDATA;
    output [STRB - 1: 0]                   S05_WSTRB;
    output [READY - 1: 0]                                  S05_BREADY,                 S05_RREADY;
        
    // output from master 00
    output [VALID - 1: 0]                                  M00_BVALID,                  M00_RVALID;
    output [DATA - 1: 0]                                                                   M00_RDATA;
    output [READY - 1: 0]  M00_AWREADY, M00_WREADY,                  M00_ARREADY;
    output [RESP - 1: 0]                                   M00_BRESP,                   M00_RRESP;
   

    wire rst_axi;
    wire [2:0] w_cntrl;
    wire [2:0] r_cntrl;
    wire w_rst_dec;
    wire r_rst_dec;
    wire w_decerr;
    wire r_decerr;
    
    assign rst_axi = ~rst;
    
    decoder write_dec(
                        .AxADDR(M00_AWADDR),
                        .AxVALID(M00_AWVALID),
                        .error(w_decerr),
                        .rst(w_rst_dec),
                        .cntrl(w_cntrl)
                        );
    
    decoder read_dec(
                        .AxADDR(M00_ARADDR),
                        .AxVALID(M00_ARVALID),
                        .error(r_decerr),
                        .rst(r_rst_dec),
                        .cntrl(r_cntrl)
                        );
    WrstFSM WriteASF(
            .AxVALID(M00_AWVALID),
            .AxREADY(M00_AWREADY),
            .xVALID(M00_WVALID),
            .xREADY(M00_WREADY),
            .BREADY(M00_BREADY),
            .BVALID(M00_BVALID),
            .decerr(w_decerr),
            .clk(clk),
            .rst(rst_axi),
            .decoderrst(w_rst_dec)
            );
            
    RrstFSM ReadASF(
            .AxVALID(M00_ARVALID),
            .AxREADY(M00_ARREADY),
            .xVALID(M00_RVALID),
            .xREADY(M00_RREADY),
            .decerr(r_decerr),
            .clk(clk),
            .rst(rst_axi),
            .decoderrst(r_rst_dec)
    );

    mux #(.A_LEN(READY), .B_LEN(READY), .C_LEN(VALID), .D_LEN(RESP))
        write_mux(    .sel(w_cntrl),
                        .a_out(M00_AWREADY), .b_out(M00_WREADY), .c_out(M00_BVALID), .d_out(M00_BRESP),
                        .a_00(S00_AWREADY), .b_00(S00_WREADY), .c_00(S00_BVALID), .d_00(S00_BRESP),
                        .a_01(S01_AWREADY), .b_01(S01_WREADY), .c_01(S01_BVALID), .d_01(S01_BRESP),
                        .a_02(S02_AWREADY), .b_02(S02_WREADY), .c_02(S02_BVALID), .d_02(S02_BRESP),
                        .a_03(S03_AWREADY), .b_03(S03_WREADY), .c_03(S03_BVALID), .d_03(S03_BRESP),
                        .a_04(S04_AWREADY), .b_04(S04_WREADY), .c_04(S04_BVALID), .d_04(S04_BRESP),
                        .a_05(S05_AWREADY), .b_05(S05_WREADY), .c_05(S05_BVALID), .d_05(S05_BRESP)
                    );
                    
    mux #(.A_LEN(READY), .B_LEN(VALID), .C_LEN(DATA), .D_LEN(RESP))
        read_mux(    .sel(r_cntrl),
                        .a_out(M00_ARREADY), .b_out(M00_RVALID), .c_out(M00_RDATA), .d_out(M00_RRESP),
                        .a_00(S00_ARREADY), .b_00(S00_RVALID), .c_00(S00_RDATA), .d_00(S00_RRESP),
                        .a_01(S01_ARREADY), .b_01(S01_RVALID), .c_01(S01_RDATA), .d_01(S01_RRESP),
                        .a_02(S02_ARREADY), .b_02(S02_RVALID), .c_02(S02_RDATA), .d_02(S02_RRESP),
                        .a_03(S03_ARREADY), .b_03(S03_RVALID), .c_03(S03_RDATA), .d_03(S03_RRESP),
                        .a_04(S04_ARREADY), .b_04(S04_RVALID), .c_04(S04_RDATA), .d_04(S04_RRESP),
                        .a_05(S05_ARREADY), .b_05(S05_RVALID), .c_05(S05_RDATA), .d_05(S05_RRESP)
                    );
   writeDemux #(
                .ADDR(ADDR),
                .VALID(VALID),
                .PROT(PROT),
                .DATA(DATA),
                .STRB(STRB),
                .READY(READY),
                .RESP(RESP)
                )   
            writeDemuxer
            (.sel(w_cntrl),
            .M00_AWADDR(M00_AWADDR), .M00_AWVALID(M00_AWVALID), .M00_AWPROT(M00_AWPROT), .M00_WVALID(M00_WVALID), .M00_WDATA(M00_WDATA), .M00_WSTRB(M00_WSTRB), .M00_BREADY(M00_BREADY),
            .S00_AWADDR(S00_AWADDR), .S00_AWVALID(S00_AWVALID), .S00_AWPROT(S00_AWPROT), .S00_WVALID(S00_WVALID), .S00_WDATA(S00_WDATA), .S00_WSTRB(S00_WSTRB), .S00_BREADY(S00_BREADY),
            .S01_AWADDR(S01_AWADDR), .S01_AWVALID(S01_AWVALID), .S01_AWPROT(S01_AWPROT), .S01_WVALID(S01_WVALID), .S01_WDATA(S01_WDATA), .S01_WSTRB(S01_WSTRB), .S01_BREADY(S01_BREADY),
            .S02_AWADDR(S02_AWADDR), .S02_AWVALID(S02_AWVALID), .S02_AWPROT(S02_AWPROT), .S02_WVALID(S02_WVALID), .S02_WDATA(S02_WDATA), .S02_WSTRB(S02_WSTRB), .S02_BREADY(S02_BREADY),
            .S03_AWADDR(S03_AWADDR), .S03_AWVALID(S03_AWVALID), .S03_AWPROT(S03_AWPROT), .S03_WVALID(S03_WVALID), .S03_WDATA(S03_WDATA), .S03_WSTRB(S03_WSTRB), .S03_BREADY(S03_BREADY),
            .S04_AWADDR(S04_AWADDR), .S04_AWVALID(S04_AWVALID), .S04_AWPROT(S04_AWPROT), .S04_WVALID(S04_WVALID), .S04_WDATA(S04_WDATA), .S04_WSTRB(S04_WSTRB), .S04_BREADY(S04_BREADY),
            .S05_AWADDR(S05_AWADDR), .S05_AWVALID(S05_AWVALID), .S05_AWPROT(S05_AWPROT), .S05_WVALID(S05_WVALID), .S05_WDATA(S05_WDATA), .S05_WSTRB(S05_WSTRB), .S05_BREADY(S05_BREADY)
            );
            
    R_demux
        #(
            .A_LEN(VALID),
            .B_LEN(ADDR),
            .C_LEN(PROT),
            .D_LEN(READY)
        )
        readDemuxer
        (
            .sel(r_cntrl),
            .a_in(M00_ARVALID), .b_in(M00_ARADDR), .c_in(M00_ARPROT), .d_in(M00_RREADY),
            .a_00_o(S00_ARVALID), .b_00_o(S00_ARADDR), .c_00_o(S00_ARPROT), .d_00_o(S00_RREADY),
            .a_01_o(S01_ARVALID), .b_01_o(S01_ARADDR), .c_01_o(S01_ARPROT), .d_01_o(S01_RREADY),
            .a_02_o(S02_ARVALID), .b_02_o(S02_ARADDR), .c_02_o(S02_ARPROT), .d_02_o(S02_RREADY),
            .a_03_o(S03_ARVALID), .b_03_o(S03_ARADDR), .c_03_o(S03_ARPROT), .d_03_o(S03_RREADY),
            .a_04_o(S04_ARVALID), .b_04_o(S04_ARADDR), .c_04_o(S04_ARPROT), .d_04_o(S04_RREADY),
            .a_05_o(S05_ARVALID), .b_05_o(S05_ARADDR), .c_05_o(S05_ARPROT), .d_05_o(S05_RREADY)
        );

    
endmodule
