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
    int counter = 1;
    int temp;
    
    covergroup cov;
      inl1: coverpoint dut_vi.vec1;
      inp2: coverpoint dut_vi.vec2;
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

        if (counter > 5)
          temp = counter%5;
        else
          temp = counter;
        
        // Wiggle pins of DUT

        @(posedge dut_vi.clk); begin
          
          if (temp == 3) begin
            dut_vi.vec1   = req.vec1;
            dut_vi.vec2   = req.vec2;
            dut_vi.start = req.start;
            counter = counter + 1;
        end
          else if (temp == 2) begin
            dut_vi.vec1   = req.vec1;
            dut_vi.vec2   = {{8'd0}, {req.vec2[15:0]}};
            dut_vi.start = req.start;
            counter = counter + 1;
          end
          else if (temp == 1) begin
            dut_vi.vec1   = req.vec1;
            dut_vi.vec2   = {{16'd0}, {req.vec2[7:0]}};
            dut_vi.start = req.start;
            counter = counter + 1;
          end
          else if (temp == 4) begin
            dut_vi.vec1   = req.vec1;
            dut_vi.vec2   = {{req.vec2[15:0]}, {8'd0}};
            dut_vi.start = req.start;
            counter = counter + 1;
          end
          else begin
            dut_vi.vec1   = req.vec1;
            dut_vi.vec2   = {{req.vec2[7:0]}, {16'd0}};
            dut_vi.start = req.start;
            counter = counter + 1;
          end
        end
        seq_item_port.item_done();
        cov.get_coverage();
        
        `uvm_info("", $sformatf("vec1 input (driver)=%h", dut_vi.vec1), UVM_MEDIUM)
        `uvm_info("", $sformatf("vec2 input (driver)=%h", dut_vi.vec2), UVM_MEDIUM)
        `uvm_info("", $sformatf("start (driver)=%d", dut_vi.start), UVM_MEDIUM)
        `uvm_info("", $sformatf("output result (driver)=%h", dut_vi.o), UVM_MEDIUM)
        `uvm_info("", $sformatf("output_valid (driver)=%d", dut_vi.o_valid), UVM_MEDIUM)
        
      end
    endtask

  endclass: my_driver
