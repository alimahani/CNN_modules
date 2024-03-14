`timescale 1ns/1ns
// ---------------------------------------------------------------------------
// Copyright:
//
// ---------------------------------------------------------------------------
//----------------------------------------------------------------------------
// Filename:			dut_interface.sv
// Version:				1.00
// Description:
//
//
//
//
//
//
// Author:              ALI MAHANI
// History:
//-----------------------------------------------------------------------------

interface dut_if;
  logic                        clk      ;
  logic                        reset    ;
  logic [23:0]                  row     ;
  logic [23:0]                  col     ;
  logic                        start    ;
  logic                        o_valid  ;
  logic [170:0]                 o       ;
  
  // TLM ports
//  logic                        o_valid;
//  logic                          start;
//  logic [23:0]                     row;
//  logic [23:0]                     col;
  

endinterface: dut_if
