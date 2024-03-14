`timescale 1ns/1ns
// ---------------------------------------------------------------------------
// Copyright:
//
// ---------------------------------------------------------------------------
//----------------------------------------------------------------------------
// Filename:			pe.sv
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


module pe #(
               parameter num        = 3,
               parameter inleft_l   = 8,
               parameter intop_l    = 8
    )
  (
   input  wire                                                            clk   ,
   input  wire                                                            reset ,
   input  wire   [inleft_l-1:0]                                           in1   ,
   input  wire   [intop_l-1:0]                                            in2   ,
   input  wire                                                            start ,
   output logic  [inleft_l-1:0]                                           o_r   ,
   output logic  [intop_l-1:0]                                            o_b   ,
   output logic  [(inleft_l + intop_l) + num - 1:0]                        o    ,
   output logic                                                           o_valid
);
  

  wire  [(inleft_l + intop_l) + num - 1 : 0]       o_t;
  wire                                         valid_t;

  always_ff @(posedge clk) begin
    
    if(reset) begin
          o           <= '0;
          o_r         <= '0;
          o_b         <= '0;
          o_valid     <= 1'b0;
    end
    else begin
       o_valid        <= valid_t;
      if(start) begin
           o          <= o_t;
           o_r        <= in1;
           o_b        <= in2;
      end
    end
  end
  
  mac_i #(
    .num        (num),
    .in1_length (inleft_l),
    .in2_length (intop_l) )
  mac1 (
    .clk    (clk),
    .reset  (reset),
    .in1    (in1),
    .in2    (in2),
    .start  (start),
    .o      (o_t),
    .o_valid(valid_t)
  );


endmodule
