interface axi4_lite_if #(
    parameter ADDRESS_WIDTH = 32,
    parameter DATA_WIDTH = 32 )();

    // AR channel signals
    logic [ADDRESS_WIDTH-1:0] araddr;
    logic                     arvalid;
    logic                     arready;
    logic [2:0]               arprot;

    // R channel signals
    logic [DATA_WIDTH-1:0]    rdata;
    logic                     rvalid;
    logic                     rready;
    logic [1:0]               rresp;

    // AW channel signals
    logic [ADDRESS_WIDTH-1:0] awaddr;
    logic                     awvalid;
    logic                     awready;
    logic [2:0]               awprot;

    // W channel signals
    logic [DATA_WIDTH-1:0]    wdata;
    logic [DATA_WIDTH/8-1:0]  wstrb;
    logic                     wvalid;
    logic                     wready;

    // B channel signals
    logic                     bvalid;
    logic                     bready;
    logic [1:0]               bresp;

    // manager interface
    modport master (
        output araddr,
        output arvalid,
        input  arready,
        output arprot,

        input  rdata,
        input  rvalid,
        output rready,
        input  rresp,

        output awaddr,
        output awvalid,
        input  awready,
        output awprot,

        output wdata,
        output wstrb,
        output wvalid,
        input  wready,

        input  bvalid,
        output bready,
        input  bresp
    );

    // subordinate interface
    modport slave (
        input  araddr,
        input  arvalid,
        output arready,
        input  arprot,

        output rdata,
        output rvalid,
        input  rready,
        output rresp,

        input  awaddr,
        input  awvalid,
        output awready,
        input  awprot,

        input  wdata,
        input  wstrb,
        input  wvalid,
        output wready,

        output bvalid,
        input  bready,
        output bresp
    );

endinterface : axi4_lite_if