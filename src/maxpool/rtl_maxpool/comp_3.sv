`timescale 1ns/1ns
// ---------------------------------------------------------------------------
// Copyright:
//
// ---------------------------------------------------------------------------
//----------------------------------------------------------------------------
// Filename:			comp_3.sv
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

module comp_3 #(
               parameter in_length = 8
    )
  (
   input  wire                                      clk   ,
   input  wire                                      reset ,
   input  wire   [in_length-1:0]                    in1   ,
   input  wire   [in_length-1:0]                    in2   ,
   input  wire   [in_length-1:0]                    in3   ,
   input  wire                                      start ,
   output logic  [in_length-1:0]                     o    ,
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
        o       <= (in1 > in2) ? ((in1 > in3) ? in1 : in3) : ((in2 > in3) ? in2 : in3);
    end
  end
  
endmodule
