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
  
    randc logic [7:0]      vec1;
    randc logic [23:0]     vec2;
    randc logic           start;
    logic               o_valid;
    logic       [56:0]        o;
    
    constraint c_in1 { vec1 >= 1; }
    constraint c_in2 { vec2 >= 1; }
    
    function new (string name = "");
      super.new(name);
    endfunction
    
    function string convert2string;
      return $sformatf("vec1=%0d, vec2=%0d,  o=%0d, o_valid=%0d", vec1, vec2, o, o_valid);
    endfunction

    function void do_copy(uvm_object rhs);
      my_transaction tx;
      tx.randomize();
      $cast(tx, rhs);
      vec1   = tx.vec1;
      vec2   = tx.vec2;
      start = tx.start;
    endfunction
    
    function bit do_compare(uvm_object rhs, uvm_comparer comparer);
      my_transaction tx;
      bit status = 1;
      $cast(tx, rhs);
      status &= (start == tx.start);
      status &= (vec1 == tx.vec1);
      status &= (vec2 == tx.vec2);
      return status;
    endfunction

  endclass: my_transaction
