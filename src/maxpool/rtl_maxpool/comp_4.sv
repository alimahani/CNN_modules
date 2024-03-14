`timescale 1ns/1ns
// ---------------------------------------------------------------------------
// Copyright:
//
// ---------------------------------------------------------------------------
//----------------------------------------------------------------------------
// Filename:			comp_4.sv
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

module comp_4 #(
               parameter in_length = 8
    )
  (
   input  wire                                      clk   ,
   input  wire                                      reset ,
   input  wire   [in_length-1:0]                    in1   ,
   input  wire   [in_length-1:0]                    in2   ,
   input  wire   [in_length-1:0]                    in3   ,
   input  wire   [in_length-1:0]                    in4   ,
   input  wire                                      start ,
   output logic [in_length-1:0]                     o     ,
   output logic                                     o_valid
);
  

  logic       [in_length-1:0]    temp0;
  logic       [in_length-1:0]    temp1;
  enum logic  { level_1 = 1'b0, level_2 = 1'b1} comp_level;

  always_ff @(posedge clk) begin
    
    if(reset) begin
          o           <=      '0;
          o_valid     <=    1'b0;
          comp_level  <= level_1;
    end
    else begin
       o_valid        <= 1'b0;
      if(start)  begin
        case (comp_level)
          level_1: begin
            temp0      <= (in1 > in2) ? in1 : in2;
            temp1      <= (in3 > in4) ? in3 : in4;
            comp_level <= level_2;
          end
          level_2: begin
            o            <= (temp0 > temp4) ? temp0 : temp4;
            o_valid      <= 1'b1;
            comp_level   <= level_1;
          end
        endcase
      end
    end
  end
  
endmodule
