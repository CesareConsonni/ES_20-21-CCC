`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.12.2020 10:58:40
// Design Name: 
// Module Name: writeDemux
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


 module writeDemux #( parameter
                ADDR = 32,
                VALID = 1,
                PROT = 3,
                DATA = 32,
                STRB = 4,
                READY = 1,
                RESP = 2
    )
            (sel,
            M00_AWADDR, M00_AWVALID, M00_AWPROT, M00_WVALID, M00_WDATA, M00_WSTRB, M00_BREADY,
            S00_AWADDR, S00_AWVALID, S00_AWPROT, S00_WVALID, S00_WDATA, S00_WSTRB, S00_BREADY,
            S01_AWADDR, S01_AWVALID, S01_AWPROT, S01_WVALID, S01_WDATA, S01_WSTRB, S01_BREADY,
            S02_AWADDR, S02_AWVALID, S02_AWPROT, S02_WVALID, S02_WDATA, S02_WSTRB, S02_BREADY,
            S03_AWADDR, S03_AWVALID, S03_AWPROT, S03_WVALID, S03_WDATA, S03_WSTRB, S03_BREADY,
            S04_AWADDR, S04_AWVALID, S04_AWPROT, S04_WVALID, S04_WDATA, S04_WSTRB, S04_BREADY,
            S05_AWADDR, S05_AWVALID, S05_AWPROT, S05_WVALID, S05_WDATA, S05_WSTRB, S05_BREADY
            );
            
    input [2:0] sel;
            
    input [ADDR-1:0]    M00_AWADDR;
    input [VALID-1:0]     M00_AWVALID;
    input [PROT-1:0]     M00_AWPROT;
    input [VALID-1:0]     M00_WVALID;
    input [DATA-1:0]    M00_WDATA;
    input [STRB-1:0]     M00_WSTRB;
    input [READY-1:0]     M00_BREADY;
    
    output [ADDR-1:0]   S00_AWADDR;
    output [VALID-1:0]    S00_AWVALID;
    output [PROT-1:0]    S00_AWPROT;
    output [VALID-1:0]    S00_WVALID;
    output [DATA-1:0]   S00_WDATA;
    output [STRB-1:0]    S00_WSTRB;
    output [READY-1:0]    S00_BREADY;
    
    output [ADDR-1:0]   S01_AWADDR;
    output [VALID-1:0]    S01_AWVALID;
    output [PROT-1:0]    S01_AWPROT;
    output [VALID-1:0]    S01_WVALID;
    output [DATA-1:0]   S01_WDATA;
    output [STRB-1:0]    S01_WSTRB;
    output [READY-1:0]    S01_BREADY;

    output [ADDR-1:0]   S02_AWADDR;
    output [VALID-1:0]    S02_AWVALID;
    output [PROT-1:0]    S02_AWPROT;
    output [VALID-1:0]    S02_WVALID;
    output [DATA-1:0]   S02_WDATA;
    output [STRB-1:0]    S02_WSTRB;
    output [READY-1:0]    S02_BREADY;
    
    output [ADDR-1:0]   S03_AWADDR;
    output [VALID-1:0]    S03_AWVALID;
    output [PROT-1:0]    S03_AWPROT;
    output [VALID-1:0]    S03_WVALID;
    output [DATA-1:0]   S03_WDATA;
    output [STRB-1:0]    S03_WSTRB;
    output [READY-1:0]    S03_BREADY;
    
    output [ADDR-1:0]   S04_AWADDR;
    output [VALID-1:0]    S04_AWVALID;
    output [PROT-1:0]    S04_AWPROT;
    output [VALID-1:0]    S04_WVALID;
    output [DATA-1:0]   S04_WDATA;
    output [STRB-1:0]    S04_WSTRB;
    output [READY-1:0]    S04_BREADY;

    output [ADDR-1:0]   S05_AWADDR;
    output [VALID-1:0]    S05_AWVALID;
    output [PROT-1:0]    S05_AWPROT;
    output [VALID-1:0]    S05_WVALID;
    output [DATA-1:0]   S05_WDATA;
    output [STRB-1:0]    S05_WSTRB;
    output [READY-1:0]    S05_BREADY;
    
    demuxer #(ADDR)
        demuxAWADDR(
            .sel(sel),
            .a(S00_AWADDR), .b(S01_AWADDR), .c(S02_AWADDR), .d(S03_AWADDR), .e(S04_AWADDR), .f(S05_AWADDR),
            .in(M00_AWADDR)   
        );
        
    demuxer #(VALID)
        demuxAWVALID(
            .sel(sel),
            .a(S00_AWVALID), .b(S01_AWVALID), .c(S02_AWVALID), .d(S03_AWVALID), .e(S04_AWVALID), .f(S05_AWVALID),
            .in(M00_AWVALID)   
        );
        
    demuxer #(PROT)
        demuxAWPROT(
            .sel(sel),
            .a(S00_AWPROT), .b(S01_AWPROT), .c(S02_AWPROT), .d(S03_AWPROT), .e(S04_AWPROT), .f(S05_AWPROT),
            .in(M00_AWPROT)   
        );
        
    demuxer #(VALID)
        demuxWVALID(
            .sel(sel),
            .a(S00_WVALID), .b(S01_WVALID), .c(S02_WVALID), .d(S03_WVALID), .e(S04_WVALID), .f(S05_WVALID),
            .in(M00_WVALID)   
        );

    demuxer #(DATA)
        demuxWDATA(
            .sel(sel),
            .a(S00_WDATA), .b(S01_WDATA), .c(S02_WDATA), .d(S03_WDATA), .e(S04_WDATA), .f(S05_WDATA),
            .in(M00_WDATA)   
        );
        
     demuxer #(STRB)
        demuxWSTRB(
            .sel(sel),
            .a(S00_WSTRB), .b(S01_WSTRB), .c(S02_WSTRB), .d(S03_WSTRB), .e(S04_WSTRB), .f(S05_WSTRB),
            .in(M00_WSTRB)   
        );   
        
    demuxer #(READY)
        demuxNUTELLA(
            .sel(sel),
            .a(S00_BREADY), .b(S01_BREADY), .c(S02_BREADY), .d(S03_BREADY), .e(S04_BREADY), .f(S05_BREADY),
            .in(M00_BREADY)   
        );

endmodule