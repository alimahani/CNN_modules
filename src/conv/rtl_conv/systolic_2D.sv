`timescale 1ns/1ns
// ---------------------------------------------------------------------------
// Copyright:
//
// ---------------------------------------------------------------------------
//----------------------------------------------------------------------------
// Filename:			systolic_2D.sv
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

module systolic_2D #(
  parameter num        = 3,
  parameter inleft_l   = 8,
  parameter intop_l    = 8
)
  (
   input  wire                                                            clk   ,
   input  wire                                                            reset ,
   input  wire   [(num * inleft_l)-1:0]                                   row   ,
   input  wire   [(num * intop_l)-1:0]                                    col   ,
   input  wire                                                            start ,
   output logic  [(num * num) * (inleft_l + intop_l + num) - 1:0]          o    ,
   output logic                                                        o_valid );

  localparam temp_l = inleft_l + intop_l + num;
  
  logic  [inleft_l - 1 : 0]  left_feed [num-1 : 0];
  logic  [intop_l - 1 : 0]   top_feed  [num-1 : 0];
  
  logic  [inleft_l - 1 : 0]     right_reg    [(num*num) -1 : 0];
  logic  [intop_l - 1 : 0]      bottom_reg   [(num*num) -1 : 0];
  logic  [temp_l - 1 : 0]       temp_mac    [(num*num) - 1 : 0];
  
    genvar r;
      generate for (r=0; r<num; r++) begin
         assign left_feed[r] = row[r*inleft_l+:inleft_l];
         assign top_feed[r] = col[r*intop_l+:intop_l];
        end
      endgenerate;
  

  pe #(
    .num (num),
    .inleft_l (inleft_l),
    .intop_l (intop_l))
  pe0_0 (
     .clk     ( clk ),
     .reset   ( reset),
     .in1     ( left_feed[0] ),
     .in2     ( top_feed[0] ),
     .o_r     ( right_reg[0]  ),
     .o_b     ( bottom_reg[0] ),
     .o       ( temp_mac[0] ),
     .start   ( start ),
     .o_valid   ()
   );
  
  //first row
  genvar k;
     generate
        for (k=1; k<num; k++) begin
   pe #(
    .num      (num),
    .inleft_l (inleft_l),
    .intop_l  (intop_l))
  pe0_k (
     .clk     ( clk ),
     .reset   ( reset),
     .in1     ( right_reg[k-1] ),
     .in2     ( top_feed[k] ),
     .o_r     ( right_reg[k]  ),
     .o_b     ( bottom_reg[k] ),
     .o       ( temp_mac[k] ),
     .start   ( start ),
     .o_valid   ()
   );
    
        end
     endgenerate
  
  //first column
    genvar m;
     generate
       for (m=1; m<num; m++) begin
   pe #(
    .num      (num),
    .inleft_l (inleft_l),
    .intop_l  (intop_l))
  pei_m (
     .clk     ( clk ),
     .reset   ( reset),
     .in1     ( left_feed[m]),
     .in2     ( bottom_reg[(m-1)*num]),
     .o_r     ( right_reg[m*num]),
     .o_b     ( bottom_reg[m*num]),
     .o       ( temp_mac[m*num]),
     .start   ( start),
     .o_valid   ()
   );
    
        end
     endgenerate

  //the rest of the array
  genvar i,j;
  generate
    
    for (i=1; i<num; i++) begin
      for(j=1; j<num; j++) begin
        
   pe #(
    .num      (num),
    .inleft_l (inleft_l),
    .intop_l  (intop_l))
  pei_j (
     .clk     ( clk ),
     .reset   ( reset),
     .in1     ( right_reg[(num*i) + (j-1)] ),
     .in2     ( bottom_reg[num*(i-1) + j] ),
     .o_r     ( right_reg[(num*i) + j]  ),
     .o_b     ( bottom_reg[(num*i) + j] ),
     .o       ( temp_mac[(num*i) + j] ),
     .start   ( start ),
     .o_valid   ()
   );
    
            end
    end
  endgenerate

//hardcoded for 9 processing elements
 
  assign o = {temp_mac[8], temp_mac[7], temp_mac[5], temp_mac[6], temp_mac[4], temp_mac[2], temp_mac[3], temp_mac[1], temp_mac[0]};
  
endmodule

