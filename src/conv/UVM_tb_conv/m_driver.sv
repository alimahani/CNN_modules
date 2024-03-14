`timescale 1ns/1ns
// ---------------------------------------------------------------------------
// Copyright:
//
// ---------------------------------------------------------------------------
//----------------------------------------------------------------------------
// Filename:			m_driver.sv
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
`include "m_sequence.sv"
`include "dut_interface.sv"

  class my_driver extends uvm_driver #(my_transaction);
  
    `uvm_component_utils(my_driver)

    virtual dut_if dut_vi;
    int count = 1;
    int temp  = 1;
    
    covergroup cov;
      inl1: coverpoint dut_vi.row;
      inp2: coverpoint dut_vi.col;
    endgroup

    function new(string name, uvm_component parent);
      super.new(name, parent);
      cov = new();
    endfunction
    
    function void build_phase(uvm_phase phase);
      // Get interface reference from config database
      if( !uvm_config_db #(virtual dut_if)::get(this, "", "dut_if", dut_vi) )
        `uvm_error("", "uvm_config_db::get failed")
    endfunction
   
    task run_phase(uvm_phase phase);
      forever
      begin

        seq_item_port.get_next_item(req);
        cov.sample();
        temp = count%5;

        // Wiggle pins of DUT

        @(posedge dut_vi.clk); begin
          
          if (temp == 1) begin
            dut_vi.row   = {{16'd0},{req.row[7:0]}};
            dut_vi.col   = {{16'd0},{req.col[7:0]}};
               dut_vi.start = req.start;
               count = count + 1;
            end
          if (temp == 2) begin
            dut_vi.row   = {{8'd0},{req.row[15:0]}};
            dut_vi.col   = {{8'd0},{req.col[15:0]}};
               dut_vi.start = req.start;
               count = count + 1;
           end
          if (temp == 3) begin
               dut_vi.row   = req.row;
               dut_vi.col   = req.col;
               dut_vi.start = req.start;
               count = count + 1;
            end
          if (temp == 4) begin
            dut_vi.row   = {{req.row[15:0]},{8'd0}};
            dut_vi.col   = {{req.col[15:0]},{8'd0}};
               dut_vi.start = req.start;
               count = count + 1;
            end
          if (temp == 0) begin
            dut_vi.row   = {{req.row[7:0]},{16'd0}};
            dut_vi.col   = {{req.col[7:0]},{16'd0}};
               dut_vi.start = req.start;
               count = count + 1;
           end
          
        end
        
        seq_item_port.item_done();
        cov.get_coverage();
        
        `uvm_info("", $sformatf("row input (driver)=%h", dut_vi.row), UVM_MEDIUM)
        `uvm_info("", $sformatf("column input (driver)=%h", dut_vi.col), UVM_MEDIUM)
        `uvm_info("", $sformatf("start (driver)=%d", dut_vi.start), UVM_MEDIUM)
        `uvm_info("", $sformatf("output result (driver)=%h", dut_vi.o), UVM_MEDIUM)
        `uvm_info("", $sformatf("output_valid (driver)=%d", dut_vi.o_valid), UVM_MEDIUM)
        
      end
    endtask

  endclass: my_driver
