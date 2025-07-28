// +FHDR--------------------------------------------------------------------------------------------------------- //
// Project ____________                                                                                           //
// File name __________ EASYAXI_TOP.v                                                                             //
// Creator ____________ Yen, Wei,Ting                                                                             //
// Built Date _________ Jul-14-2025                                                                               //
// Function ___________                                                                                           //
// Hierarchy __________                                                                                           //
//   Parent ___________                                                                                           //
//   Children _________                                                                                           //
// Revision history ___ Date        Author            Description                                                 //
//                  ___                                                                                           //
// -FHDR--------------------------------------------------------------------------------------------------------- //
//+...........+...................+.............................................................................. //
//3...........15..................35............................................................................. //
`timescale 1ns/10ps

module EASYAXI_TOP (
  input   wire                    clk,
  input   wire                    rst_n,
  input   wire                    enable
);

// tag COMPONENTs and SIGNALs declaration --------------------------------------------------------------------------

// Inst Master
  wire                            axi_mst_arvalid;
  wire                            axi_mst_arready;
  wire  [ `AXI_ID_W    -1 : 0]    axi_mst_arid;
  wire  [ `AXI_ADDR_W  -1 : 0]    axi_mst_araddr;
  wire  [ `AXI_LEN_W   -1 : 0]    axi_mst_arlen;
  wire  [ `AXI_SIZE_W  -1 : 0]    axi_mst_arsize;
  wire  [ `AXI_BURST_W -1 : 0]    axi_mst_arburst;

  wire                            axi_mst_rvalid;
  wire                            axi_mst_rready;
  wire  [ `AXI_DATA_W  -1 : 0]    axi_mst_rdata;
  wire  [ `AXI_RESP_W  -1 : 0]    axi_mst_rresp;
  wire                            axi_mst_rlast;

// Inst Slave
  wire                            axi_slv_arvalid;
  wire                            axi_slv_arready;
  wire  [ `AXI_ID_W    -1 : 0]    axi_slv_arid;
  wire  [ `AXI_ADDR_W  -1 : 0]    axi_slv_araddr;
  wire  [ `AXI_LEN_W   -1 : 0]    axi_slv_arlen;
  wire  [ `AXI_SIZE_W  -1 : 0]    axi_slv_arsize;
  wire  [ `AXI_BURST_W -1 : 0]    axi_slv_arburst;

  wire                            axi_slv_rvalid;
  wire                            axi_slv_rready;
  wire  [ `AXI_DATA_W  -1 : 0]    axi_slv_rdata;
  wire  [ `AXI_RESP_W  -1 : 0]    axi_slv_rresp;
  wire                            axi_slv_rlast;

// tag OUTs assignment ---------------------------------------------------------------------------------------------
// tag INs assignment ----------------------------------------------------------------------------------------------
// tag COMBINATIONAL LOGIC -----------------------------------------------------------------------------------------
// tag COMBINATIONAL PROCESS ---------------------------------------------------------------------------------------
  assign axi_slv_arvalid          = axi_mst_arvalid;
  assign axi_mst_arready          = axi_slv_arready;
  assign axi_slv_arid             = axi_mst_arid ;
  assign axi_slv_araddr           = axi_mst_araddr;
  assign axi_slv_arlen            = axi_mst_arlen;
  assign axi_slv_arsize           = axi_mst_arsize;
  assign axi_slv_arburst          = axi_mst_arburst;

  assign axi_mst_rvalid           = axi_slv_rvalid;
  assign axi_slv_rready           = axi_mst_rready;
  assign axi_mst_rdata            = axi_slv_rdata;
  assign axi_mst_rresp            = axi_slv_rresp;
  assign axi_mst_rlast            = axi_slv_rlast;

// tag SEQUENTIAL LOGIC --------------------------------------------------------------------------------------------
// ***********************/**/**\**\****/**/**\**\****/**/**\**\****/**/**\**\****/**/**\**\****/**/**\**\****/**/**
//                       /**/****\**\**/**/****\**\**/**/****\**\**/**/****\**\**/**/****\**\**/**/****\**\**/**/***
// *********************/**/******\**\/**/******\**\/**/******\**\/**/******\**\/**/******\**\/**/******\**\/**/****

// Inst Master
EASYAXI_MST U_EASYAXI_MST (
    .clk                          ( clk             ), // i
    .rst_n                        ( rst_n           ), // i
    .enable                       ( enable          ), // i
    .axi_mst_arvalid              ( axi_mst_arvalid ), // o
    .axi_mst_arready              ( axi_mst_arready ), // i
    .axi_mst_arid                 ( axi_mst_arid    ), // o
    .axi_mst_araddr               ( axi_mst_araddr  ), // o
    .axi_mst_arlen                ( axi_mst_arlen   ), // o
    .axi_mst_arsize               ( axi_mst_arsize  ), // o
    .axi_mst_arburst              ( axi_mst_arburst ), // o

    .axi_mst_rvalid               ( axi_mst_rvalid  ), // i
    .axi_mst_rready               ( axi_mst_rready  ), // o
    .axi_mst_rdata                ( axi_mst_rdata   ), // i
    .axi_mst_rresp                ( axi_mst_rresp   ), // i
    .axi_mst_rlast                ( axi_mst_rlast   )  // i
);

// Inst Slave
EASYAXI_SLV U_EASYAXI_SLV (
    .clk                          ( clk             ), // i
    .rst_n                        ( rst_n           ), // i
    .enable                       ( enable          ), // i
    .axi_slv_arvalid              ( axi_slv_arvalid ), // i
    .axi_slv_arready              ( axi_slv_arready ), // o
    .axi_slv_arid                 ( axi_slv_arid    ), // i
    .axi_slv_araddr               ( axi_slv_araddr  ), // i
    .axi_slv_arlen                ( axi_slv_arlen   ), // i
    .axi_slv_arsize               ( axi_slv_arsize  ), // i
    .axi_slv_arburst              ( axi_slv_arburst ), // i

    .axi_slv_rvalid               ( axi_slv_rvalid  ), // o
    .axi_slv_rready               ( axi_slv_rready  ), // i
    .axi_slv_rdata                ( axi_slv_rdata   ), // o
    .axi_slv_rresp                ( axi_slv_rresp   ), // o
    .axi_slv_rlast                ( axi_slv_rlast   )  // o
);

endmodule