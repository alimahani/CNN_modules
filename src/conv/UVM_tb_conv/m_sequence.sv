`timescale 1ns/1ns
// ---------------------------------------------------------------------------
// Copyright:
//
// ---------------------------------------------------------------------------
//----------------------------------------------------------------------------
// Filename:			m_sequence.sv
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
`include "m_transaction.sv"
  import uvm_pkg::*;

  typedef uvm_sequencer #(my_transaction) my_sequencer;


  class my_sequence extends uvm_sequence #(my_transaction);
  
    `uvm_object_utils(my_sequence)
        
    function new (string name = "");
      super.new(name);
    endfunction

    task body;
      if (starting_phase != null)
        starting_phase.raise_objection(this);

      repeat(10)
      begin

        req = my_transaction::type_id::create("req");
        start_item(req);
        if( !req.randomize() )
          `uvm_error("", "Randomize failed")
          #15ns;
        finish_item(req);
      end
      
      if (starting_phase != null)
        starting_phase.drop_objection(this);
    endtask: body
   
  endclass: my_sequence

