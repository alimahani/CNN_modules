`timescale 1ns/1ns
// ---------------------------------------------------------------------------
// Copyright:
//
// ---------------------------------------------------------------------------
//----------------------------------------------------------------------------
// Filename:			m_monitor.sv
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


class my_monitor extends uvm_monitor;
  `uvm_component_utils(my_monitor)

  // Declare necessary interfaces or signals here
    virtual dut_if dut_vi;

    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);

      // Get interface reference from config database
      if( !uvm_config_db #(virtual dut_if)::get(this, "", "dut_if", dut_vi) )
        `uvm_error("", "uvm_config_db::get failed")
    endfunction


    task run_phase(uvm_phase phase);
      forever
      begin

        // Wiggle pins of DUT
        @(posedge dut_vi.clk);
        
        $display("output in monitor: %0h", dut_vi.o);
        $display("output_valid in monitor: %0d", dut_vi.o_valid);
        $display("start in monitor: %0d", dut_vi.start);
        $display("row input in monitor: %0h", dut_vi.row);
        $display("column input in monitor: %0h", dut_vi.col);
      end
  endtask: run_phase
endclass: my_monitor
