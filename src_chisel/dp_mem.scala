import chisel3._
import chisel3.util.log2Ceil
// ---------------------------------------------------------------------------
// Copyright:
//
// ---------------------------------------------------------------------------
//----------------------------------------------------------------------------
// Filename:			dp_mem.scala
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

class dp_mem (val width:Int= 16, val depth:Int= 256) extends Module {
  val io = IO(new Bundle {

      val en_a = Input(Bool())
      val en_b = Input(Bool())
      val wr = Input(Bool())
      val addr_a = Input(UInt(8.W))
      val addr_b = Input (UInt(8.W))
      val din_a = Input(UInt(width.W))
      val din_b = Input(UInt(width.W))
      val dout_a = Output(UInt(width.W))
      val dout_b = Output (UInt(width.W))
  })

  val mem = SyncReadMem(depth, UInt(width.W))


  when (io.wr === 1.B) {
    mem.write(io.addr_a, io.din_a)
    mem.write(io.addr_b, io.din_b)
  }
    io.dout_a := mem.read(io.addr_a, io.en_a)
    io.dout_b := mem.read(io.addr_b, io.en_b)

}

object dp_mem extends App {
  emitVerilog(new dp_mem())
}