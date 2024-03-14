`timescale 1ns/1ns
// ---------------------------------------------------------------------------
// Copyright:
//
// ---------------------------------------------------------------------------
//----------------------------------------------------------------------------
// Filename:			m_transaction.sv
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

  class my_transaction extends uvm_sequence_item;
  
    `uvm_object_utils(my_transaction)
  
    randc logic [23:0]      row;
    randc logic [23:0]      col;
    randc logic           start;
    logic               o_valid;
    logic       [170:0]       o;
    
    constraint c_in1 { row >= 1; }
    constraint c_in2 { col >= 1; }
    
    function new (string name = "");
      super.new(name);
    endfunction
    
    function string convert2string;
      return $sformatf("row=%0d, col=%0d,  o=%0d, o_valid=%0d", row, col, o, o_valid);
    endfunction

    function void do_copy(uvm_object rhs);
      my_transaction tx;
      tx.randomize();
      $cast(tx, rhs);
      row   = tx.row;
      col   = tx.col;
      start = tx.start;
    endfunction
    
    function bit do_compare(uvm_object rhs, uvm_comparer comparer);
      my_transaction tx;
      bit status = 1;
      $cast(tx, rhs);
      status &= (start == tx.start);
      status &= (row == tx.row);
      status &= (col == tx.col);
      return status;
    endfunction

  endclass: my_transaction
