`timescale 1ns/1ns
// ----------------------------------------------------------------------
// Copyright:
//
// ----------------------------------------------------------------------
//----------------------------------------------------------------------------
// Filename:			mac_i.sv
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

module mac_i #(
               parameter num        = 3,
               parameter in1_length = 8,
               parameter in2_length = 8
    )
  (
   input  wire                                                            clk   ,
   input  wire                                                            reset ,
   input  wire  [in1_length-1:0]                                          in1   ,
   input  wire  [in2_length-1:0]                                          in2   ,
   input  wire                                                            start ,
   output logic [(in1_length + in2_length) + num - 1:0]                   o     ,
   output logic                                     o_valid
);
  

  always_ff @(posedge clk) begin
    
    if(reset) begin
          o           <= '0;
          o_valid     <= 1'b0;
    end
    else begin
       o_valid        <= start;
      if(start)
           o          <= in1 * in2 + o;
    end
  end
  
endmodule
