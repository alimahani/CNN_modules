`timescale 1ns/1ns
// ---------------------------------------------------------------------------
// Copyright:
//
// ---------------------------------------------------------------------------
//----------------------------------------------------------------------------
// Filename:			testbench.sv
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
`include "test.sv"

module top;

  import uvm_pkg::*;
//  import my_pkg::*;
  
  dut_if dut_if1();
  
  f_connected dut1 (
         
    .clk(dut_if1.clk),
    .reset(dut_if1.reset),
    .vec1(dut_if1.vec1),
    .vec2(dut_if1.vec2),
    .start(dut_if1.start),
    .o(dut_if1.o),
    .o_valid(dut_if1.o_valid)
    );


  initial
     begin
      dut_if1.reset = 1;
      #6 dut_if1.reset = 0;
     end
  
  // Clock generator
initial
  begin
    dut_if1.clk = 0;
    forever #5 dut_if1.clk = ~dut_if1.clk;
  end
  
  initial
  begin
    uvm_config_db #(virtual dut_if)::set(null, "*", "dut_if", dut_if1);
    
    uvm_top.finish_on_completion = 1;
    run_test("my_test");
  end

endmodule: top
