`timescale 1ns/1ns
// ---------------------------------------------------------------------------
// Copyright:
//
// ---------------------------------------------------------------------------
//----------------------------------------------------------------------------
// Filename:			comp_9.sv
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

module comp_9 #(
               parameter in_length = 8
    )
  (
   input  wire                                      clk   ,
   input  wire                                      reset ,
   input  wire  [in_length-1:0]                    in1    ,
   input  wire  [in_length-1:0]                    in2    ,
   input  wire  [in_length-1:0]                    in3    ,
   input  wire  [in_length-1:0]                    in4    ,
   input  wire  [in_length-1:0]                    in5    ,
   input  wire  [in_length-1:0]                    in6    ,
   input  wire  [in_length-1:0]                    in7    ,
   input  wire  [in_length-1:0]                    in8    ,
   input  wire  [in_length-1:0]                    in9    ,
   input  wire                                      start ,
   output logic [in_length-1:0]                     o     ,
   output logic                                     o_valid
);
  

  logic  [in_length-1:0]    temp0;
  logic  [in_length-1:0]    temp1;
  logic  [in_length-1:0]    temp2;


  always_ff @(posedge clk) begin
    
    if(reset) begin
          o               <= '0;
          o_valid         <= 1'b0;
    end
    else if(start)
            o             <= (temp0 > temp1) ? ((temp0 > temp2) ? temp0 : temp2) : ((temp1 > temp2) ? temp1 : temp2);
  end
  
  comp_3 #(
    .in_length (in_length) )
  comp_3_1(
    .clk    (clk),
    .reset  (reset),
    .in1    (in1),
    .in2    (in2),
    .in3    (in3),
    .start  (start),
    .o      (temp0),
    .o_valid()
);
  
  comp_3 #(
    .in_length (in_length) )
  comp_3_2(
    .clk    (clk),
    .reset  (reset),
    .in1    (in4),
    .in2    (in5),
    .in3    (in6),
    .start  (start),
    .o      (temp1),
    .o_valid()
);

  comp_3 #(
    .in_length (in_length) )
  comp_3_3(
    .clk    (clk),
    .reset  (reset),
    .in1    (in7),
    .in2    (in8),
    .in3    (in9),
    .start  (start),
    .o      (temp2),
    .o_valid()
);
  
  
endmodule

