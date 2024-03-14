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
  logic [7:0]                  vec1     ;
  logic [23:0]                 vec2     ;
  logic                        start    ;
  logic                        o_valid  ;
  logic [56:0]                  o       ;
  
  // TLM ports
//  logic                        o_valid;
//  logic                          start;
//  logic [23:0]                    vec1;
//  logic [23:0]                    vec2;
  

endinterface: dut_if
