`timescale 1ns/1ns
// ---------------------------------------------------------------------------
// Copyright:
//
// ---------------------------------------------------------------------------
//----------------------------------------------------------------------------
// Filename:			ReLU.sv
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

`include "uvm_macros.svh"
 import uvm_pkg::*;

module ReLU #(
  parameter num         = 5,
  parameter in_length   = 8
)
  (
   input  wire                                       clk     ,
   input  wire                                       reset   ,
   input  wire   [(num * in_length) -1 : 0]          in_vec  ,
   input  wire                                       start   ,
   output logic  [(num * in_length) - 1:0]            o      ,
   output logic                                     o_valid );

  

  logic signed [in_length - 1 : 0]        temp   [num - 1 : 0];
  logic signed [in_length - 1 : 0]        temp1  [num - 1 : 0];
    
    genvar r;
      generate for (r=0; r<num; r++) begin
        assign temp[r] = in_vec[r*in_length+:in_length];
        end
      endgenerate;
  
      genvar j;
      generate for(j=0; j<num; j++) begin
        assign temp1[j]    = (start & (temp[j] < 0)) ? 'b0 : temp[j];
        end
      endgenerate

  //hardcoded for 3*3 downsampling operation
  
  always_ff @(posedge clk) begin
    
    if(reset) begin
          o               <= '0;
          o_valid         <= 1'b0;
    end
    else if (start) begin
      o_valid      <= start;
      o            <={{temp1[4]}, {temp1[3]}, {temp1[2]}, {temp1[1]}, {temp1[0]}};
  end
  end
  
endmodule

