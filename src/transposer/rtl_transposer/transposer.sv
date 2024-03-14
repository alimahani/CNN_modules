`timescale 1ns/1ns
// ---------------------------------------------------------------------------
// Copyright:
//
// ---------------------------------------------------------------------------
//----------------------------------------------------------------------------
// Filename:			transposer.sv
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

module transposer #(
  parameter num         = 3,     //number of rows and columns
  parameter num_rw      = 1,     // number of read/write per access
  parameter in_length   = 8
)
  (
   input  wire                                              clk     ,
   input  wire                                              reset   ,
   input  wire   [($clog2(num*num)/num_rw) -1 : 0]          in_add  ,
   input  wire                                              start   ,
   output logic  [($clog2(num*num)/num_rw) - 1:0]           o_add   ,
   output logic                                             o_valid ,
    output logic  [5:0]                                     counter_r1,
    output logic  [5:0]                                     counter_c1);
  

  //hardcoded for 5*5 matrix and one element read per register access
    logic  [5:0] counter_r;
    logic  [5:0] counter_c;
  
  always_ff @(posedge clk) begin
    
    if(reset) begin
          o_add             <= 8'b0;
          o_valid           <= 1'b0;
          counter_r         <= 1'b0;
          counter_c         <= 1'b0;
    end
    else if (start) begin
      counter_r1        <= counter_r;
      counter_c1        <= counter_c;
      
      if (in_add > ((num+1) * counter_r)) begin
        
        o_add       <= in_add + (counter_c - counter_r) * (num-1);
        counter_c   <= (counter_c < ((counter_r * num) + (num - 1))) ? counter_c + num_rw : 1'b0;
        counter_r   <= (counter_c < ((counter_r * num) + (num - 1))) ? counter_r : counter_r + num_rw ;
        
      end
      else if (in_add == ((num+1) * counter_r)) begin
        
        o_add        <= in_add;
        counter_c    <= counter_c + num_rw;
        
      end
      
      else begin

        o_add          <= in_add - (counter_r - counter_c) * (num-1);
        counter_c      <= counter_c + num_rw;
        
      end
    end
  end
  
endmodule
