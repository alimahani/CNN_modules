`timescale 1ns/1ns
// ---------------------------------------------------------------------------
// Copyright:
//
// ---------------------------------------------------------------------------
//----------------------------------------------------------------------------
// Filename:			f_connected.sv
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

module f_connected #(
  parameter num        = 3,
  parameter inleft_l   = 8,
  parameter intop_l    = 8
)
  (
   input  wire                                                            clk     ,
   input  wire                                                            reset   ,
   input  wire   [inleft_l -1 : 0]                                        vec1     ,
   input  wire   [(num * intop_l)-1:0]                                    vec2     ,
   input  wire                                                             start   ,
   output logic  [num * (inleft_l + intop_l + num) - 1:0]                   o      ,
   output logic                                                           o_valid );

  localparam temp_l = inleft_l + intop_l + num;
  
  logic  [inleft_l - 1 : 0]  left_feed ;
  logic  [intop_l - 1 : 0]   top_feed  [num-1 : 0];
  
  logic  [inleft_l - 1 : 0]     right_reg    [num -1 : 0];
  logic  [temp_l - 1 : 0]        temp_mac   [num - 1 : 0];
  
  assign left_feed = vec1;
  
    genvar r;
      generate for (r=0; r<num; r++) begin
        assign top_feed[r] = vec2[r*intop_l+:intop_l];
        end
      endgenerate;
  

  pe #(
    .num (num),
    .inleft_l (inleft_l),
    .intop_l (intop_l))
  pe0_0 (
     .clk     ( clk ),
     .reset   ( reset),
     .in1     ( left_feed ),
     .in2     ( top_feed[0] ),
     .o_r     ( right_reg[0]  ),
     .o_b     ( ),
     .o       ( temp_mac[0] ),
     .start   ( start ),
     .o_valid   ()
   );
      
  

  //the rest of the vector
  genvar j;
  generate
    
      for(j=1; j<num; j++) begin
        
   pe #(
    .num      (num),
    .inleft_l (inleft_l),
    .intop_l  (intop_l))
  pei_j (
     .clk     ( clk ),
     .reset   ( reset),
     .in1     ( right_reg[j-1] ),
     .in2     ( top_feed[j] ),
     .o_r     ( right_reg[j] ),
     .o_b     ( ),
     .o       ( temp_mac[j] ),
     .start   ( start ),
     .o_valid   ()
   );
    
    end
  endgenerate

//hardcoded for 3 elements
  assign o = {temp_mac[2], temp_mac[1], temp_mac[0]};
  
endmodule
