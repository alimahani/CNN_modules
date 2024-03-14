import chisel3._
import chisel3.util.log2Ceil
import chisel3.util.Decoupled

// ---------------------------------------------------------------------------
// Copyright:
//
// ---------------------------------------------------------------------------
//----------------------------------------------------------------------------
// Filename:			regfile.scala
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


class regfile(val regnum: Int=12, val size: Int=16) extends Module {

   val io         = IO(new Bundle {
    val registers =  Input(Vec(regnum,UInt(size.W)))
    val addrs     = Input(UInt(size.W))
    val en        = Input(Bits(1.W))
    val regout    = Output(UInt(size.W))
  })
  val buffer = RegInit(VecInit(Seq.fill(regnum)(0.U(size.W)))) // initialize

  if (reset == 1.U) {
    for (i <- 0 until regnum) {
      buffer(i) := 0.U(size.W)
    }
  } else {
    for(i<-0 until regnum) {
      buffer(i)  := io.registers(i)
    }
  }
  when(io.en === 1.U) {
    io.regout := buffer(io.addrs)
  } otherwise{
    io.regout := 0.U(size.W)
  }

}

// to get the Verilog code

object regfile extends App {
  emitVerilog(new regfile())
}
