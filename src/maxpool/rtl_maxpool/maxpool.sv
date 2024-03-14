`timescale 1ns/1ns
// ---------------------------------------------------------------------------
// Copyright:
//
// ---------------------------------------------------------------------------
//----------------------------------------------------------------------------
// Filename:			maxpool.sv
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

module maxpool #(
  parameter num         = 9,
  parameter in_length   = 8
)
  (
   input  wire                                       clk     ,
   input  wire                                       reset   ,
   input  wire   [(num * in_length) -1 : 0]          in_vec  ,
   input  wire                                       start   ,
   output logic  [in_length - 1:0]                    o      ,
   output logic                                     o_valid );

  

  logic  [in_length - 1 : 0]        temp   [num - 1 : 0];
    
    genvar r;
      generate for (r=0; r<num; r++) begin
        assign temp[r] = in_vec[r*in_length+:in_length];
        end
      endgenerate;
  

  //hardcoded for 5 elements

  
  comp_9 #(
    .in_length (in_length))
  comp9_1 (
    .clk         ( clk ),
    .reset      ( reset),
    .in1     ( temp[0] ),
    .in2     ( temp[1] ),
    .in3     ( temp[2] ),
    .in4     ( temp[3] ),
    .in5     ( temp[4] ),
    .in6     ( temp[5] ),
    .in7     ( temp[6] ),
    .in8     ( temp[7] ),
    .in9     ( temp[8] ),
    .o             ( o ),
    .start     ( start ),
    .o_valid          ()
   );
      
    
endmodule
  
  
module comp_5 #(
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
   input  wire                                      start ,
   output logic [in_length-1:0]                     o     ,
   output logic                                     o_valid
);
  

  logic  [in_length-1:0]    temp0;
  logic  [in_length-1:0]    temp1;
  enum logic {level_1 = 1'b0, level_2 = 1'b1} cmp_level;

  always_ff @(posedge clk) begin
    
    if(reset) begin
          o               <= '0;
          o_valid         <= 1'b0;
          cmp_level       <= level_1;
    end
    else begin
      
      case (cmp_level)
          
        level_1: begin
        o_valid            <= 1'b0;
      
          if(start) begin
        temp0              <= (in1 > in2) ? ((in1 > in3) ? in1 : in3) : ((in2 > in3) ? in2 : in3);
         temp1             <= (in3 > in4) ? ((in3 > in4) ? in3 : in5) : ((in4 > in5) ? in4 : in5);
          cmp_level        <=  level_2;
        end
        end
        
        level_2: begin
          o_valid          <= start;
          o                <= (temp0 > temp1) ? temp0 : temp1;
          cmp_level        <= level_1;
        end
      endcase
  end
  end
  
endmodule

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
