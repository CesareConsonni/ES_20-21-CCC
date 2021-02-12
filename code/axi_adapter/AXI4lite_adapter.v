`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.12.2020 12:52:53
// Design Name: 
// Module Name: AXI4lite_adapter
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


module AXI4lite_adapter
        #( parameter
                ADDR = 32,
                BURST = 2,
                CACHE = 4,
                DATA = 32,
                LAST = 1,
                LEN = 4,
                LOCK = 2,
                PROT = 3,
                READY = 1,
                RESP = 2,
                SIZE = 3,
                STRB = 4,
                VALID = 1,
                USER = 1
        )
    (
//CPU
    //input
    ARM_AWADDR,                                     ARM_ARADDR,
    ARM_AWBURST,                                    ARM_ARBURST,
    ARM_AWCACHE,                                    ARM_ARCACHE,
                    ARM_WDATA,
                    ARM_WLAST,
    ARM_AWLEN,                                      ARM_ARLEN,
    ARM_AWLOCK,                                     ARM_ARLOCK,
    ARM_AWPROT,                                     ARM_ARPROT,
                                    ARM_BREADY,                     ARM_RREADY,
    ARM_AWSIZE,                                     ARM_ARSIZE,
                    ARM_WSTRB,
    ARM_AWVALID,    ARM_WVALID,                     ARM_ARVALID,
    ARM_AWUSER,                                     ARM_ARUSER,
    //output
                                                                    ARM_RDATA,
                                                                    ARM_RLAST,
    ARM_AWREADY,    ARM_WREADY,                     ARM_ARREADY,
                                    ARM_BRESP,                      ARM_RRESP ,
                                    ARM_BVALID,                     ARM_RVALID,

//AXI
    //input
                                                                    AXI_RDATA,
    AXI_AWREADY,    AXI_WREADY,                     AXI_ARREADY,
                                    AXI_BRESP,                      AXI_RRESP ,
                                    AXI_BVALID,                     AXI_RVALID,
    //output
    AXI_AWADDR,                                     AXI_ARADDR,
                    AXI_WDATA,
    AXI_AWPROT,                                     AXI_ARPROT,
                                    AXI_BREADY,                     AXI_RREADY,
                    AXI_WSTRB,
    AXI_AWVALID,    AXI_WVALID,                     AXI_ARVALID
    );
    
    //CPU connection
    input [ADDR-1: 0]   ARM_AWADDR,                                     ARM_ARADDR;
    input [BURST-1: 0]  ARM_AWBURST,                                    ARM_ARBURST;
    input [CACHE-1: 0]  ARM_AWCACHE,                                    ARM_ARCACHE;
    input [DATA-1: 0]                   ARM_WDATA;
    input [LAST-1: 0]                   ARM_WLAST;
    input [LEN-1: 0]    ARM_AWLEN,                                      ARM_ARLEN;
    input [LOCK-1: 0]   ARM_AWLOCK,                                     ARM_ARLOCK;
    input [PROT-1: 0]   ARM_AWPROT,                                     ARM_ARPROT;
    input [READY-1: 0]                                  ARM_BREADY,                     ARM_RREADY;
    input [SIZE-1: 0]   ARM_AWSIZE,                                     ARM_ARSIZE;
    input [STRB-1: 0]                   ARM_WSTRB;
    input [VALID-1: 0]  ARM_AWVALID,    ARM_WVALID,                     ARM_ARVALID;
    input [USER-1: 0]   ARM_AWUSER,                                     ARM_ARUSER;
    
    output [DATA-1: 0]                                                                  ARM_RDATA;
    output [LAST-1: 0]                                                                  ARM_RLAST;
    output [READY-1: 0] ARM_AWREADY,    ARM_WREADY,                     ARM_ARREADY;
    output [RESP-1: 0]                                  ARM_BRESP,                      ARM_RRESP ;
    output [VALID-1: 0]                                 ARM_BVALID,                     ARM_RVALID;

    //AXI connection    
    input [DATA-1: 0]                                                                   AXI_RDATA;
    input [READY-1: 0]  AXI_AWREADY,    AXI_WREADY,                     AXI_ARREADY;
    input [RESP-1: 0]                                   AXI_BRESP,                      AXI_RRESP ;
    input [VALID-1: 0]                                  AXI_BVALID,                     AXI_RVALID;

    output [ADDR-1: 0]  AXI_AWADDR,                                     AXI_ARADDR;
    output [DATA-1: 0]                  AXI_WDATA;
    output [PROT-1: 0]  AXI_AWPROT,                                     AXI_ARPROT;
    output [READY-1: 0]                                 AXI_BREADY,                     AXI_RREADY;
    output [STRB-1: 0]                  AXI_WSTRB;
    output [VALID-1: 0] AXI_AWVALID,    AXI_WVALID,                     AXI_ARVALID;
    
    //assign from processor to peripheral
    assign AXI_AWADDR = ARM_AWADDR;
    assign AXI_ARADDR = ARM_ARADDR;
    assign AXI_WDATA = ARM_WDATA;
    assign AXI_AWPROT = ARM_AWPROT;
    assign AXI_ARPROT = ARM_ARPROT;
    assign AXI_BREADY = ARM_BREADY;
    assign AXI_RREADY = ARM_RREADY;
    assign AXI_WSTRB = ARM_WSTRB;
    assign AXI_AWVALID = ARM_AWVALID;
    assign AXI_WVALID = ARM_WVALID;
    assign AXI_ARVALID = ARM_ARVALID;
    
    //assign from peripheral to processor
    assign ARM_RDATA = AXI_RDATA;
    assign ARM_AWREADY = AXI_AWREADY;
    assign ARM_WREADY = AXI_WREADY;
    assign ARM_ARREADY = AXI_ARREADY;
    assign ARM_BRESP = AXI_BRESP;
    assign ARM_RRESP = AXI_RRESP;
    assign ARM_BVALID = AXI_BVALID;
    assign ARM_RVALID = AXI_RVALID;
    
        

endmodule
