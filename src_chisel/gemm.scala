import chisel3._
import chisel3.DontCare
import chisel3.util.log2Ceil

// ---------------------------------------------------------------------------
// Copyright:
//
// ---------------------------------------------------------------------------
//----------------------------------------------------------------------------
// Filename:			gemm.scala
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


// Systolic architecture for A * B

class gemm(val rw:Int = 3 ,val co: Int = 3, val input_w:Int = 16) extends Module {
  val io = IO(new Bundle {

    val x_input       = Input(Vec(rw, UInt(input_w.W))) //Input matrix (feed as a vector to each pe)
    val w_input       = Input(Vec(co, UInt((input_w * 2).W))) //Input matrix (feed as a vector to each pe)
    val input_valid   = Input(Vec((rw * co), Bool())) // left-side inputs
    val iormac        = Input (Vec((rw * co), Bool()))
    val out           = Output(Vec((co * rw), UInt((input_w * 2).W))) //output results
  })

  // pe instantiation as a matrix: rw * co

  val pe_elements = VecInit(Seq.fill(rw * co) {
    Module(new pe(input_w)).io
  })

//  wires for interconnection

  val v_incnt    = Wire(Vec((rw * co), UInt((input_w * 2).W))) // wires to connect pe's
  val h_incnt    = Wire(Vec((rw * co), UInt(input_w.W))) // wires to connect pe's


  //*******************************************************************************
                               // Connections
  //*******************************************************************************

  //first node
  pe_elements(0).ve_input                := io.w_input(0)
  pe_elements(0).ho_input                := io.x_input(0)
  pe_elements(0).input_valid             := io.input_valid(0)
  pe_elements(0).iormac                  := io.iormac(0)
  v_incnt(0)                             := pe_elements(0).ve_out
  h_incnt(0)                             := pe_elements(0).ho_out
  io.out(0)                              := pe_elements(0).res_out

  //First row interconnections
  for (indx <- 1 until co) {

    pe_elements(indx).ve_input            := io.w_input(indx)
    pe_elements(indx).ho_input            := h_incnt(indx - 1)
    pe_elements(indx).input_valid         := io.input_valid(indx)
    pe_elements(indx).iormac              := io.iormac(indx)
    v_incnt (indx)                        := pe_elements(indx).ve_out
    h_incnt(indx)                         := pe_elements(indx).ho_out
    io.out(indx)                          := pe_elements(indx).res_out
  }

  //First column interconnections
  for (indx <- 1 until rw) {

    pe_elements(indx * co).ho_input     := io.x_input(indx)
    pe_elements(indx * co).ve_input     := v_incnt((indx - 1) * co)
    pe_elements(indx * co).input_valid  := io.input_valid(indx * co)
    pe_elements(indx * co).iormac       := io.iormac(indx * co)
    h_incnt(indx * co)                  := pe_elements (indx * co).ho_out
    v_incnt(indx * co)                  := pe_elements (indx * co).ve_out
    io.out(indx * co)                   := pe_elements(indx * co).res_out

  }


  // body of systolic array

  for (m <- 1 until rw) {
    for (n <- 1 until co) {
      pe_elements((m * rw) + n).ve_input      := v_incnt(((m -1) * co) + n)
      pe_elements((m * rw) + n).ho_input      := h_incnt((m * co) + n - 1)
      pe_elements((m * rw) + n).input_valid   := io.input_valid((m * rw) + n)
      pe_elements((m * rw) + n).iormac        := io.iormac((m * rw) + n)
      v_incnt((m * rw) + n)                   := pe_elements((m * rw) + n).ve_out
      h_incnt((m * co) + n)                   := pe_elements((m * rw) + n).ho_out
      io.out((m * rw) + n)                    := pe_elements((m * rw) + n).res_out

    }

  }

                                 // Last row interconnections
  // in this architecture the systolic array has (co * rw) output port to access the PE computation results
  // but the last row needs to change to reduce the output port to "co"

  //  for (indx <- co * (rw - 1) until (rw * co) - 1) {

  //    pe_elements(indx).ho_input          := io.x_input()
  //    pe_elements(indx).ve_input          := v_incnt(indx - rw)
  //    pe_elements(indx).input_valid       := io.input_valid(indx)
  //    h_incnt(indx + 1)                   := pe_elements(indx).ho_out
  //    v_incnt(indx)                       := pe_elements(indx).ve_out
  //    io.out(indx)                        := pe_elements(indx).res_out

  //  }


}

object gemm extends App {
  emitVerilog(new gemm())
}
