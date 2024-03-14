import chisel3._
import chisel3.util.log2Ceil
import chisel3.util.Decoupled

// ---------------------------------------------------------------------------
// Copyright:
//
// ---------------------------------------------------------------------------
//----------------------------------------------------------------------------
// Filename:			pe.scala
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


//  processing element with 2 input ports and 2 output ports for MAC operation

class pe(val input_w:Int = 16) extends Module {
  val io = IO(new Bundle {

    val ho_input = Input(UInt(input_w.W)) //left-side input (main input or from the right-side pe)
    val ve_input = Input(UInt((input_w * 2).W)) // upper input (main input or from the upper pe)
    val input_valid = Input(Bool()) // Inputs are valid to start the operation
    //  val readyvalid   = Flipped(Decoupled (UInt(32.W)))          //
    val iormac = Input(Bool())
    val ve_out = Output(UInt((input_w * 2).W)) // bottom output to the lower pe
    val ho_out = Output(UInt((input_w).W)) // bottom output to the lower pe
    val res_out = Output(UInt((input_w * 2).W)) // result register
  })


  val mac    = RegInit((UInt((input_w * 2).W)), 0.U)
  val ho_reg = RegInit((UInt(input_w.W)), 0.U)
  val ve_reg = RegInit((UInt((input_w*2).W)), 0.U)

  def risingedge(x: Bool) = x && !RegNext(x)

  // start at rising edge of input_valid


  when((risingedge(io.input_valid) === 1.B)) {

    mac         := mac + (io.ho_input * io.ve_input) //MAC operation
    ho_reg      := io.ho_input
    ve_reg      := io.ve_input

  }

  io.res_out := mac                           //assign mac results to the ouyput
  io.ve_out  := Mux(io.iormac, ve_reg, mac)   //select the assign value to the vertical output (vertical input or mac result)
  io.ho_out  := ho_reg                        // assign horizontal input to the output

}

// to get the Verilog code

object pe extends App {
  emitVerilog(new pe())
}
