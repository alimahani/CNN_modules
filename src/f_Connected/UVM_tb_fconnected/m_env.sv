`timescale 1ns/1ns
// ---------------------------------------------------------------------------
// Copyright:
//
// ---------------------------------------------------------------------------
//----------------------------------------------------------------------------
// Filename:			m_env.sv
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
`include "m_driver.sv"
`include "m_monitor.sv"


class my_env extends uvm_env;

    `uvm_component_utils(my_env)
    
    my_sequencer m_seqr;
    my_driver    m_driv;
    my_monitor   m_mnr;
    
    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction
 
    function void build_phase(uvm_phase phase);
      m_seqr = my_sequencer::type_id::create("m_seqr", this);
      m_driv = my_driver::type_id::create("m_driv", this);
      m_mnr = my_monitor::type_id::create("m_mnr", this);
    endfunction
    
    function void connect_phase(uvm_phase phase);
      m_driv.seq_item_port.connect( m_seqr.seq_item_export );
    endfunction
    
  endclass: my_env
