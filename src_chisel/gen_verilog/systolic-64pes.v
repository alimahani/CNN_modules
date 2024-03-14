module bc_pe(
  input         clock,
  input         reset,
  input  [15:0] io_ho_input,
  input  [31:0] io_ve_input,
  input         io_input_valid,
  input         io_iormac,
  output [31:0] io_ve_out,
  output [15:0] io_ho_out,
  output [31:0] io_res_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mac; // @[bc_pe.scala 30:23]
  reg [15:0] ho_reg; // @[bc_pe.scala 31:23]
  reg [31:0] ve_reg; // @[bc_pe.scala 32:23]
  reg  REG; // @[bc_pe.scala 37:42]
  wire  _T_1 = io_input_valid & ~REG; // @[bc_pe.scala 37:31]
  wire [47:0] _mac_T = io_ho_input * io_ve_input; // @[bc_pe.scala 44:39]
  wire [47:0] _GEN_3 = {{16'd0}, mac}; // @[bc_pe.scala 44:24]
  wire [47:0] _mac_T_2 = _GEN_3 + _mac_T; // @[bc_pe.scala 44:24]
  wire [47:0] _GEN_0 = _T_1 ? _mac_T_2 : {{16'd0}, mac}; // @[bc_pe.scala 42:46 44:17 30:23]
  wire [47:0] _GEN_4 = reset ? 48'h0 : _GEN_0; // @[bc_pe.scala 30:{23,23}]
  assign io_ve_out = io_iormac ? ve_reg : mac; // @[bc_pe.scala 51:20]
  assign io_ho_out = ho_reg; // @[bc_pe.scala 52:14]
  assign io_res_out = mac; // @[bc_pe.scala 50:14]
  always @(posedge clock) begin
    mac <= _GEN_4[31:0]; // @[bc_pe.scala 30:{23,23}]
    if (reset) begin // @[bc_pe.scala 31:23]
      ho_reg <= 16'h0; // @[bc_pe.scala 31:23]
    end else if (_T_1) begin // @[bc_pe.scala 42:46]
      ho_reg <= io_ho_input; // @[bc_pe.scala 45:17]
    end
    if (reset) begin // @[bc_pe.scala 32:23]
      ve_reg <= 32'h0; // @[bc_pe.scala 32:23]
    end else if (_T_1) begin // @[bc_pe.scala 42:46]
      ve_reg <= io_ve_input; // @[bc_pe.scala 46:17]
    end
    REG <= io_input_valid; // @[bc_pe.scala 37:42]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  mac = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  ho_reg = _RAND_1[15:0];
  _RAND_2 = {1{`RANDOM}};
  ve_reg = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  REG = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module bc_mmul(
  input         clock,
  input         reset,
  input  [15:0] io_x_input_0,
  input  [15:0] io_x_input_1,
  input  [15:0] io_x_input_2,
  input  [15:0] io_x_input_3,
  input  [15:0] io_x_input_4,
  input  [15:0] io_x_input_5,
  input  [15:0] io_x_input_6,
  input  [15:0] io_x_input_7,
  input  [31:0] io_w_input_0,
  input  [31:0] io_w_input_1,
  input  [31:0] io_w_input_2,
  input  [31:0] io_w_input_3,
  input  [31:0] io_w_input_4,
  input  [31:0] io_w_input_5,
  input  [31:0] io_w_input_6,
  input  [31:0] io_w_input_7,
  input         io_input_valid_0,
  input         io_input_valid_1,
  input         io_input_valid_2,
  input         io_input_valid_3,
  input         io_input_valid_4,
  input         io_input_valid_5,
  input         io_input_valid_6,
  input         io_input_valid_7,
  input         io_input_valid_8,
  input         io_input_valid_9,
  input         io_input_valid_10,
  input         io_input_valid_11,
  input         io_input_valid_12,
  input         io_input_valid_13,
  input         io_input_valid_14,
  input         io_input_valid_15,
  input         io_input_valid_16,
  input         io_input_valid_17,
  input         io_input_valid_18,
  input         io_input_valid_19,
  input         io_input_valid_20,
  input         io_input_valid_21,
  input         io_input_valid_22,
  input         io_input_valid_23,
  input         io_input_valid_24,
  input         io_input_valid_25,
  input         io_input_valid_26,
  input         io_input_valid_27,
  input         io_input_valid_28,
  input         io_input_valid_29,
  input         io_input_valid_30,
  input         io_input_valid_31,
  input         io_input_valid_32,
  input         io_input_valid_33,
  input         io_input_valid_34,
  input         io_input_valid_35,
  input         io_input_valid_36,
  input         io_input_valid_37,
  input         io_input_valid_38,
  input         io_input_valid_39,
  input         io_input_valid_40,
  input         io_input_valid_41,
  input         io_input_valid_42,
  input         io_input_valid_43,
  input         io_input_valid_44,
  input         io_input_valid_45,
  input         io_input_valid_46,
  input         io_input_valid_47,
  input         io_input_valid_48,
  input         io_input_valid_49,
  input         io_input_valid_50,
  input         io_input_valid_51,
  input         io_input_valid_52,
  input         io_input_valid_53,
  input         io_input_valid_54,
  input         io_input_valid_55,
  input         io_input_valid_56,
  input         io_input_valid_57,
  input         io_input_valid_58,
  input         io_input_valid_59,
  input         io_input_valid_60,
  input         io_input_valid_61,
  input         io_input_valid_62,
  input         io_input_valid_63,
  input         io_iormac_0,
  input         io_iormac_1,
  input         io_iormac_2,
  input         io_iormac_3,
  input         io_iormac_4,
  input         io_iormac_5,
  input         io_iormac_6,
  input         io_iormac_7,
  input         io_iormac_8,
  input         io_iormac_9,
  input         io_iormac_10,
  input         io_iormac_11,
  input         io_iormac_12,
  input         io_iormac_13,
  input         io_iormac_14,
  input         io_iormac_15,
  input         io_iormac_16,
  input         io_iormac_17,
  input         io_iormac_18,
  input         io_iormac_19,
  input         io_iormac_20,
  input         io_iormac_21,
  input         io_iormac_22,
  input         io_iormac_23,
  input         io_iormac_24,
  input         io_iormac_25,
  input         io_iormac_26,
  input         io_iormac_27,
  input         io_iormac_28,
  input         io_iormac_29,
  input         io_iormac_30,
  input         io_iormac_31,
  input         io_iormac_32,
  input         io_iormac_33,
  input         io_iormac_34,
  input         io_iormac_35,
  input         io_iormac_36,
  input         io_iormac_37,
  input         io_iormac_38,
  input         io_iormac_39,
  input         io_iormac_40,
  input         io_iormac_41,
  input         io_iormac_42,
  input         io_iormac_43,
  input         io_iormac_44,
  input         io_iormac_45,
  input         io_iormac_46,
  input         io_iormac_47,
  input         io_iormac_48,
  input         io_iormac_49,
  input         io_iormac_50,
  input         io_iormac_51,
  input         io_iormac_52,
  input         io_iormac_53,
  input         io_iormac_54,
  input         io_iormac_55,
  input         io_iormac_56,
  input         io_iormac_57,
  input         io_iormac_58,
  input         io_iormac_59,
  input         io_iormac_60,
  input         io_iormac_61,
  input         io_iormac_62,
  input         io_iormac_63,
  output [31:0] io_out_0,
  output [31:0] io_out_1,
  output [31:0] io_out_2,
  output [31:0] io_out_3,
  output [31:0] io_out_4,
  output [31:0] io_out_5,
  output [31:0] io_out_6,
  output [31:0] io_out_7,
  output [31:0] io_out_8,
  output [31:0] io_out_9,
  output [31:0] io_out_10,
  output [31:0] io_out_11,
  output [31:0] io_out_12,
  output [31:0] io_out_13,
  output [31:0] io_out_14,
  output [31:0] io_out_15,
  output [31:0] io_out_16,
  output [31:0] io_out_17,
  output [31:0] io_out_18,
  output [31:0] io_out_19,
  output [31:0] io_out_20,
  output [31:0] io_out_21,
  output [31:0] io_out_22,
  output [31:0] io_out_23,
  output [31:0] io_out_24,
  output [31:0] io_out_25,
  output [31:0] io_out_26,
  output [31:0] io_out_27,
  output [31:0] io_out_28,
  output [31:0] io_out_29,
  output [31:0] io_out_30,
  output [31:0] io_out_31,
  output [31:0] io_out_32,
  output [31:0] io_out_33,
  output [31:0] io_out_34,
  output [31:0] io_out_35,
  output [31:0] io_out_36,
  output [31:0] io_out_37,
  output [31:0] io_out_38,
  output [31:0] io_out_39,
  output [31:0] io_out_40,
  output [31:0] io_out_41,
  output [31:0] io_out_42,
  output [31:0] io_out_43,
  output [31:0] io_out_44,
  output [31:0] io_out_45,
  output [31:0] io_out_46,
  output [31:0] io_out_47,
  output [31:0] io_out_48,
  output [31:0] io_out_49,
  output [31:0] io_out_50,
  output [31:0] io_out_51,
  output [31:0] io_out_52,
  output [31:0] io_out_53,
  output [31:0] io_out_54,
  output [31:0] io_out_55,
  output [31:0] io_out_56,
  output [31:0] io_out_57,
  output [31:0] io_out_58,
  output [31:0] io_out_59,
  output [31:0] io_out_60,
  output [31:0] io_out_61,
  output [31:0] io_out_62,
  output [31:0] io_out_63
);
  wire  bc_pe_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_1_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_1_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_1_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_1_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_1_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_1_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_1_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_1_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_1_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_2_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_2_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_2_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_2_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_2_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_2_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_2_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_2_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_2_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_3_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_3_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_3_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_3_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_3_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_3_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_3_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_3_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_3_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_4_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_4_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_4_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_4_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_4_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_4_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_4_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_4_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_4_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_5_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_5_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_5_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_5_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_5_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_5_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_5_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_5_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_5_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_6_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_6_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_6_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_6_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_6_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_6_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_6_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_6_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_6_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_7_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_7_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_7_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_7_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_7_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_7_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_7_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_7_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_7_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_8_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_8_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_8_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_8_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_8_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_8_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_8_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_8_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_8_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_9_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_9_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_9_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_9_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_9_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_9_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_9_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_9_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_9_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_10_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_10_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_10_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_10_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_10_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_10_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_10_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_10_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_10_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_11_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_11_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_11_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_11_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_11_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_11_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_11_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_11_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_11_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_12_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_12_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_12_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_12_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_12_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_12_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_12_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_12_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_12_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_13_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_13_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_13_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_13_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_13_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_13_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_13_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_13_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_13_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_14_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_14_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_14_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_14_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_14_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_14_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_14_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_14_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_14_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_15_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_15_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_15_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_15_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_15_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_15_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_15_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_15_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_15_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_16_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_16_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_16_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_16_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_16_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_16_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_16_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_16_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_16_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_17_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_17_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_17_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_17_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_17_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_17_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_17_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_17_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_17_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_18_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_18_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_18_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_18_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_18_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_18_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_18_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_18_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_18_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_19_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_19_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_19_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_19_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_19_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_19_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_19_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_19_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_19_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_20_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_20_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_20_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_20_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_20_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_20_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_20_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_20_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_20_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_21_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_21_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_21_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_21_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_21_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_21_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_21_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_21_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_21_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_22_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_22_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_22_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_22_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_22_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_22_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_22_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_22_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_22_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_23_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_23_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_23_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_23_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_23_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_23_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_23_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_23_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_23_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_24_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_24_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_24_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_24_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_24_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_24_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_24_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_24_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_24_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_25_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_25_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_25_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_25_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_25_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_25_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_25_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_25_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_25_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_26_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_26_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_26_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_26_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_26_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_26_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_26_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_26_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_26_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_27_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_27_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_27_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_27_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_27_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_27_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_27_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_27_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_27_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_28_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_28_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_28_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_28_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_28_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_28_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_28_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_28_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_28_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_29_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_29_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_29_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_29_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_29_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_29_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_29_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_29_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_29_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_30_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_30_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_30_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_30_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_30_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_30_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_30_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_30_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_30_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_31_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_31_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_31_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_31_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_31_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_31_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_31_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_31_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_31_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_32_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_32_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_32_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_32_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_32_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_32_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_32_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_32_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_32_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_33_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_33_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_33_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_33_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_33_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_33_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_33_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_33_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_33_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_34_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_34_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_34_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_34_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_34_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_34_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_34_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_34_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_34_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_35_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_35_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_35_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_35_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_35_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_35_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_35_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_35_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_35_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_36_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_36_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_36_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_36_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_36_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_36_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_36_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_36_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_36_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_37_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_37_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_37_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_37_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_37_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_37_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_37_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_37_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_37_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_38_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_38_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_38_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_38_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_38_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_38_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_38_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_38_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_38_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_39_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_39_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_39_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_39_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_39_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_39_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_39_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_39_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_39_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_40_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_40_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_40_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_40_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_40_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_40_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_40_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_40_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_40_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_41_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_41_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_41_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_41_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_41_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_41_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_41_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_41_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_41_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_42_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_42_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_42_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_42_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_42_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_42_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_42_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_42_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_42_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_43_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_43_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_43_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_43_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_43_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_43_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_43_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_43_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_43_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_44_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_44_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_44_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_44_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_44_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_44_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_44_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_44_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_44_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_45_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_45_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_45_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_45_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_45_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_45_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_45_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_45_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_45_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_46_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_46_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_46_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_46_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_46_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_46_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_46_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_46_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_46_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_47_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_47_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_47_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_47_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_47_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_47_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_47_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_47_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_47_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_48_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_48_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_48_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_48_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_48_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_48_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_48_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_48_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_48_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_49_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_49_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_49_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_49_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_49_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_49_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_49_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_49_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_49_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_50_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_50_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_50_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_50_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_50_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_50_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_50_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_50_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_50_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_51_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_51_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_51_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_51_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_51_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_51_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_51_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_51_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_51_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_52_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_52_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_52_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_52_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_52_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_52_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_52_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_52_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_52_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_53_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_53_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_53_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_53_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_53_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_53_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_53_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_53_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_53_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_54_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_54_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_54_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_54_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_54_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_54_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_54_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_54_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_54_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_55_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_55_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_55_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_55_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_55_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_55_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_55_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_55_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_55_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_56_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_56_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_56_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_56_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_56_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_56_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_56_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_56_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_56_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_57_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_57_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_57_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_57_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_57_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_57_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_57_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_57_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_57_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_58_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_58_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_58_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_58_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_58_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_58_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_58_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_58_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_58_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_59_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_59_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_59_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_59_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_59_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_59_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_59_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_59_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_59_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_60_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_60_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_60_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_60_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_60_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_60_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_60_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_60_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_60_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_61_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_61_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_61_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_61_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_61_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_61_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_61_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_61_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_61_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_62_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_62_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_62_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_62_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_62_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_62_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_62_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_62_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_62_io_res_out; // @[bc_mmul.scala 23:11]
  wire  bc_pe_63_clock; // @[bc_mmul.scala 23:11]
  wire  bc_pe_63_reset; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_63_io_ho_input; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_63_io_ve_input; // @[bc_mmul.scala 23:11]
  wire  bc_pe_63_io_input_valid; // @[bc_mmul.scala 23:11]
  wire  bc_pe_63_io_iormac; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_63_io_ve_out; // @[bc_mmul.scala 23:11]
  wire [15:0] bc_pe_63_io_ho_out; // @[bc_mmul.scala 23:11]
  wire [31:0] bc_pe_63_io_res_out; // @[bc_mmul.scala 23:11]
  bc_pe bc_pe ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_clock),
    .reset(bc_pe_reset),
    .io_ho_input(bc_pe_io_ho_input),
    .io_ve_input(bc_pe_io_ve_input),
    .io_input_valid(bc_pe_io_input_valid),
    .io_iormac(bc_pe_io_iormac),
    .io_ve_out(bc_pe_io_ve_out),
    .io_ho_out(bc_pe_io_ho_out),
    .io_res_out(bc_pe_io_res_out)
  );
  bc_pe bc_pe_1 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_1_clock),
    .reset(bc_pe_1_reset),
    .io_ho_input(bc_pe_1_io_ho_input),
    .io_ve_input(bc_pe_1_io_ve_input),
    .io_input_valid(bc_pe_1_io_input_valid),
    .io_iormac(bc_pe_1_io_iormac),
    .io_ve_out(bc_pe_1_io_ve_out),
    .io_ho_out(bc_pe_1_io_ho_out),
    .io_res_out(bc_pe_1_io_res_out)
  );
  bc_pe bc_pe_2 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_2_clock),
    .reset(bc_pe_2_reset),
    .io_ho_input(bc_pe_2_io_ho_input),
    .io_ve_input(bc_pe_2_io_ve_input),
    .io_input_valid(bc_pe_2_io_input_valid),
    .io_iormac(bc_pe_2_io_iormac),
    .io_ve_out(bc_pe_2_io_ve_out),
    .io_ho_out(bc_pe_2_io_ho_out),
    .io_res_out(bc_pe_2_io_res_out)
  );
  bc_pe bc_pe_3 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_3_clock),
    .reset(bc_pe_3_reset),
    .io_ho_input(bc_pe_3_io_ho_input),
    .io_ve_input(bc_pe_3_io_ve_input),
    .io_input_valid(bc_pe_3_io_input_valid),
    .io_iormac(bc_pe_3_io_iormac),
    .io_ve_out(bc_pe_3_io_ve_out),
    .io_ho_out(bc_pe_3_io_ho_out),
    .io_res_out(bc_pe_3_io_res_out)
  );
  bc_pe bc_pe_4 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_4_clock),
    .reset(bc_pe_4_reset),
    .io_ho_input(bc_pe_4_io_ho_input),
    .io_ve_input(bc_pe_4_io_ve_input),
    .io_input_valid(bc_pe_4_io_input_valid),
    .io_iormac(bc_pe_4_io_iormac),
    .io_ve_out(bc_pe_4_io_ve_out),
    .io_ho_out(bc_pe_4_io_ho_out),
    .io_res_out(bc_pe_4_io_res_out)
  );
  bc_pe bc_pe_5 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_5_clock),
    .reset(bc_pe_5_reset),
    .io_ho_input(bc_pe_5_io_ho_input),
    .io_ve_input(bc_pe_5_io_ve_input),
    .io_input_valid(bc_pe_5_io_input_valid),
    .io_iormac(bc_pe_5_io_iormac),
    .io_ve_out(bc_pe_5_io_ve_out),
    .io_ho_out(bc_pe_5_io_ho_out),
    .io_res_out(bc_pe_5_io_res_out)
  );
  bc_pe bc_pe_6 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_6_clock),
    .reset(bc_pe_6_reset),
    .io_ho_input(bc_pe_6_io_ho_input),
    .io_ve_input(bc_pe_6_io_ve_input),
    .io_input_valid(bc_pe_6_io_input_valid),
    .io_iormac(bc_pe_6_io_iormac),
    .io_ve_out(bc_pe_6_io_ve_out),
    .io_ho_out(bc_pe_6_io_ho_out),
    .io_res_out(bc_pe_6_io_res_out)
  );
  bc_pe bc_pe_7 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_7_clock),
    .reset(bc_pe_7_reset),
    .io_ho_input(bc_pe_7_io_ho_input),
    .io_ve_input(bc_pe_7_io_ve_input),
    .io_input_valid(bc_pe_7_io_input_valid),
    .io_iormac(bc_pe_7_io_iormac),
    .io_ve_out(bc_pe_7_io_ve_out),
    .io_ho_out(bc_pe_7_io_ho_out),
    .io_res_out(bc_pe_7_io_res_out)
  );
  bc_pe bc_pe_8 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_8_clock),
    .reset(bc_pe_8_reset),
    .io_ho_input(bc_pe_8_io_ho_input),
    .io_ve_input(bc_pe_8_io_ve_input),
    .io_input_valid(bc_pe_8_io_input_valid),
    .io_iormac(bc_pe_8_io_iormac),
    .io_ve_out(bc_pe_8_io_ve_out),
    .io_ho_out(bc_pe_8_io_ho_out),
    .io_res_out(bc_pe_8_io_res_out)
  );
  bc_pe bc_pe_9 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_9_clock),
    .reset(bc_pe_9_reset),
    .io_ho_input(bc_pe_9_io_ho_input),
    .io_ve_input(bc_pe_9_io_ve_input),
    .io_input_valid(bc_pe_9_io_input_valid),
    .io_iormac(bc_pe_9_io_iormac),
    .io_ve_out(bc_pe_9_io_ve_out),
    .io_ho_out(bc_pe_9_io_ho_out),
    .io_res_out(bc_pe_9_io_res_out)
  );
  bc_pe bc_pe_10 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_10_clock),
    .reset(bc_pe_10_reset),
    .io_ho_input(bc_pe_10_io_ho_input),
    .io_ve_input(bc_pe_10_io_ve_input),
    .io_input_valid(bc_pe_10_io_input_valid),
    .io_iormac(bc_pe_10_io_iormac),
    .io_ve_out(bc_pe_10_io_ve_out),
    .io_ho_out(bc_pe_10_io_ho_out),
    .io_res_out(bc_pe_10_io_res_out)
  );
  bc_pe bc_pe_11 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_11_clock),
    .reset(bc_pe_11_reset),
    .io_ho_input(bc_pe_11_io_ho_input),
    .io_ve_input(bc_pe_11_io_ve_input),
    .io_input_valid(bc_pe_11_io_input_valid),
    .io_iormac(bc_pe_11_io_iormac),
    .io_ve_out(bc_pe_11_io_ve_out),
    .io_ho_out(bc_pe_11_io_ho_out),
    .io_res_out(bc_pe_11_io_res_out)
  );
  bc_pe bc_pe_12 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_12_clock),
    .reset(bc_pe_12_reset),
    .io_ho_input(bc_pe_12_io_ho_input),
    .io_ve_input(bc_pe_12_io_ve_input),
    .io_input_valid(bc_pe_12_io_input_valid),
    .io_iormac(bc_pe_12_io_iormac),
    .io_ve_out(bc_pe_12_io_ve_out),
    .io_ho_out(bc_pe_12_io_ho_out),
    .io_res_out(bc_pe_12_io_res_out)
  );
  bc_pe bc_pe_13 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_13_clock),
    .reset(bc_pe_13_reset),
    .io_ho_input(bc_pe_13_io_ho_input),
    .io_ve_input(bc_pe_13_io_ve_input),
    .io_input_valid(bc_pe_13_io_input_valid),
    .io_iormac(bc_pe_13_io_iormac),
    .io_ve_out(bc_pe_13_io_ve_out),
    .io_ho_out(bc_pe_13_io_ho_out),
    .io_res_out(bc_pe_13_io_res_out)
  );
  bc_pe bc_pe_14 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_14_clock),
    .reset(bc_pe_14_reset),
    .io_ho_input(bc_pe_14_io_ho_input),
    .io_ve_input(bc_pe_14_io_ve_input),
    .io_input_valid(bc_pe_14_io_input_valid),
    .io_iormac(bc_pe_14_io_iormac),
    .io_ve_out(bc_pe_14_io_ve_out),
    .io_ho_out(bc_pe_14_io_ho_out),
    .io_res_out(bc_pe_14_io_res_out)
  );
  bc_pe bc_pe_15 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_15_clock),
    .reset(bc_pe_15_reset),
    .io_ho_input(bc_pe_15_io_ho_input),
    .io_ve_input(bc_pe_15_io_ve_input),
    .io_input_valid(bc_pe_15_io_input_valid),
    .io_iormac(bc_pe_15_io_iormac),
    .io_ve_out(bc_pe_15_io_ve_out),
    .io_ho_out(bc_pe_15_io_ho_out),
    .io_res_out(bc_pe_15_io_res_out)
  );
  bc_pe bc_pe_16 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_16_clock),
    .reset(bc_pe_16_reset),
    .io_ho_input(bc_pe_16_io_ho_input),
    .io_ve_input(bc_pe_16_io_ve_input),
    .io_input_valid(bc_pe_16_io_input_valid),
    .io_iormac(bc_pe_16_io_iormac),
    .io_ve_out(bc_pe_16_io_ve_out),
    .io_ho_out(bc_pe_16_io_ho_out),
    .io_res_out(bc_pe_16_io_res_out)
  );
  bc_pe bc_pe_17 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_17_clock),
    .reset(bc_pe_17_reset),
    .io_ho_input(bc_pe_17_io_ho_input),
    .io_ve_input(bc_pe_17_io_ve_input),
    .io_input_valid(bc_pe_17_io_input_valid),
    .io_iormac(bc_pe_17_io_iormac),
    .io_ve_out(bc_pe_17_io_ve_out),
    .io_ho_out(bc_pe_17_io_ho_out),
    .io_res_out(bc_pe_17_io_res_out)
  );
  bc_pe bc_pe_18 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_18_clock),
    .reset(bc_pe_18_reset),
    .io_ho_input(bc_pe_18_io_ho_input),
    .io_ve_input(bc_pe_18_io_ve_input),
    .io_input_valid(bc_pe_18_io_input_valid),
    .io_iormac(bc_pe_18_io_iormac),
    .io_ve_out(bc_pe_18_io_ve_out),
    .io_ho_out(bc_pe_18_io_ho_out),
    .io_res_out(bc_pe_18_io_res_out)
  );
  bc_pe bc_pe_19 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_19_clock),
    .reset(bc_pe_19_reset),
    .io_ho_input(bc_pe_19_io_ho_input),
    .io_ve_input(bc_pe_19_io_ve_input),
    .io_input_valid(bc_pe_19_io_input_valid),
    .io_iormac(bc_pe_19_io_iormac),
    .io_ve_out(bc_pe_19_io_ve_out),
    .io_ho_out(bc_pe_19_io_ho_out),
    .io_res_out(bc_pe_19_io_res_out)
  );
  bc_pe bc_pe_20 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_20_clock),
    .reset(bc_pe_20_reset),
    .io_ho_input(bc_pe_20_io_ho_input),
    .io_ve_input(bc_pe_20_io_ve_input),
    .io_input_valid(bc_pe_20_io_input_valid),
    .io_iormac(bc_pe_20_io_iormac),
    .io_ve_out(bc_pe_20_io_ve_out),
    .io_ho_out(bc_pe_20_io_ho_out),
    .io_res_out(bc_pe_20_io_res_out)
  );
  bc_pe bc_pe_21 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_21_clock),
    .reset(bc_pe_21_reset),
    .io_ho_input(bc_pe_21_io_ho_input),
    .io_ve_input(bc_pe_21_io_ve_input),
    .io_input_valid(bc_pe_21_io_input_valid),
    .io_iormac(bc_pe_21_io_iormac),
    .io_ve_out(bc_pe_21_io_ve_out),
    .io_ho_out(bc_pe_21_io_ho_out),
    .io_res_out(bc_pe_21_io_res_out)
  );
  bc_pe bc_pe_22 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_22_clock),
    .reset(bc_pe_22_reset),
    .io_ho_input(bc_pe_22_io_ho_input),
    .io_ve_input(bc_pe_22_io_ve_input),
    .io_input_valid(bc_pe_22_io_input_valid),
    .io_iormac(bc_pe_22_io_iormac),
    .io_ve_out(bc_pe_22_io_ve_out),
    .io_ho_out(bc_pe_22_io_ho_out),
    .io_res_out(bc_pe_22_io_res_out)
  );
  bc_pe bc_pe_23 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_23_clock),
    .reset(bc_pe_23_reset),
    .io_ho_input(bc_pe_23_io_ho_input),
    .io_ve_input(bc_pe_23_io_ve_input),
    .io_input_valid(bc_pe_23_io_input_valid),
    .io_iormac(bc_pe_23_io_iormac),
    .io_ve_out(bc_pe_23_io_ve_out),
    .io_ho_out(bc_pe_23_io_ho_out),
    .io_res_out(bc_pe_23_io_res_out)
  );
  bc_pe bc_pe_24 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_24_clock),
    .reset(bc_pe_24_reset),
    .io_ho_input(bc_pe_24_io_ho_input),
    .io_ve_input(bc_pe_24_io_ve_input),
    .io_input_valid(bc_pe_24_io_input_valid),
    .io_iormac(bc_pe_24_io_iormac),
    .io_ve_out(bc_pe_24_io_ve_out),
    .io_ho_out(bc_pe_24_io_ho_out),
    .io_res_out(bc_pe_24_io_res_out)
  );
  bc_pe bc_pe_25 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_25_clock),
    .reset(bc_pe_25_reset),
    .io_ho_input(bc_pe_25_io_ho_input),
    .io_ve_input(bc_pe_25_io_ve_input),
    .io_input_valid(bc_pe_25_io_input_valid),
    .io_iormac(bc_pe_25_io_iormac),
    .io_ve_out(bc_pe_25_io_ve_out),
    .io_ho_out(bc_pe_25_io_ho_out),
    .io_res_out(bc_pe_25_io_res_out)
  );
  bc_pe bc_pe_26 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_26_clock),
    .reset(bc_pe_26_reset),
    .io_ho_input(bc_pe_26_io_ho_input),
    .io_ve_input(bc_pe_26_io_ve_input),
    .io_input_valid(bc_pe_26_io_input_valid),
    .io_iormac(bc_pe_26_io_iormac),
    .io_ve_out(bc_pe_26_io_ve_out),
    .io_ho_out(bc_pe_26_io_ho_out),
    .io_res_out(bc_pe_26_io_res_out)
  );
  bc_pe bc_pe_27 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_27_clock),
    .reset(bc_pe_27_reset),
    .io_ho_input(bc_pe_27_io_ho_input),
    .io_ve_input(bc_pe_27_io_ve_input),
    .io_input_valid(bc_pe_27_io_input_valid),
    .io_iormac(bc_pe_27_io_iormac),
    .io_ve_out(bc_pe_27_io_ve_out),
    .io_ho_out(bc_pe_27_io_ho_out),
    .io_res_out(bc_pe_27_io_res_out)
  );
  bc_pe bc_pe_28 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_28_clock),
    .reset(bc_pe_28_reset),
    .io_ho_input(bc_pe_28_io_ho_input),
    .io_ve_input(bc_pe_28_io_ve_input),
    .io_input_valid(bc_pe_28_io_input_valid),
    .io_iormac(bc_pe_28_io_iormac),
    .io_ve_out(bc_pe_28_io_ve_out),
    .io_ho_out(bc_pe_28_io_ho_out),
    .io_res_out(bc_pe_28_io_res_out)
  );
  bc_pe bc_pe_29 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_29_clock),
    .reset(bc_pe_29_reset),
    .io_ho_input(bc_pe_29_io_ho_input),
    .io_ve_input(bc_pe_29_io_ve_input),
    .io_input_valid(bc_pe_29_io_input_valid),
    .io_iormac(bc_pe_29_io_iormac),
    .io_ve_out(bc_pe_29_io_ve_out),
    .io_ho_out(bc_pe_29_io_ho_out),
    .io_res_out(bc_pe_29_io_res_out)
  );
  bc_pe bc_pe_30 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_30_clock),
    .reset(bc_pe_30_reset),
    .io_ho_input(bc_pe_30_io_ho_input),
    .io_ve_input(bc_pe_30_io_ve_input),
    .io_input_valid(bc_pe_30_io_input_valid),
    .io_iormac(bc_pe_30_io_iormac),
    .io_ve_out(bc_pe_30_io_ve_out),
    .io_ho_out(bc_pe_30_io_ho_out),
    .io_res_out(bc_pe_30_io_res_out)
  );
  bc_pe bc_pe_31 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_31_clock),
    .reset(bc_pe_31_reset),
    .io_ho_input(bc_pe_31_io_ho_input),
    .io_ve_input(bc_pe_31_io_ve_input),
    .io_input_valid(bc_pe_31_io_input_valid),
    .io_iormac(bc_pe_31_io_iormac),
    .io_ve_out(bc_pe_31_io_ve_out),
    .io_ho_out(bc_pe_31_io_ho_out),
    .io_res_out(bc_pe_31_io_res_out)
  );
  bc_pe bc_pe_32 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_32_clock),
    .reset(bc_pe_32_reset),
    .io_ho_input(bc_pe_32_io_ho_input),
    .io_ve_input(bc_pe_32_io_ve_input),
    .io_input_valid(bc_pe_32_io_input_valid),
    .io_iormac(bc_pe_32_io_iormac),
    .io_ve_out(bc_pe_32_io_ve_out),
    .io_ho_out(bc_pe_32_io_ho_out),
    .io_res_out(bc_pe_32_io_res_out)
  );
  bc_pe bc_pe_33 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_33_clock),
    .reset(bc_pe_33_reset),
    .io_ho_input(bc_pe_33_io_ho_input),
    .io_ve_input(bc_pe_33_io_ve_input),
    .io_input_valid(bc_pe_33_io_input_valid),
    .io_iormac(bc_pe_33_io_iormac),
    .io_ve_out(bc_pe_33_io_ve_out),
    .io_ho_out(bc_pe_33_io_ho_out),
    .io_res_out(bc_pe_33_io_res_out)
  );
  bc_pe bc_pe_34 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_34_clock),
    .reset(bc_pe_34_reset),
    .io_ho_input(bc_pe_34_io_ho_input),
    .io_ve_input(bc_pe_34_io_ve_input),
    .io_input_valid(bc_pe_34_io_input_valid),
    .io_iormac(bc_pe_34_io_iormac),
    .io_ve_out(bc_pe_34_io_ve_out),
    .io_ho_out(bc_pe_34_io_ho_out),
    .io_res_out(bc_pe_34_io_res_out)
  );
  bc_pe bc_pe_35 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_35_clock),
    .reset(bc_pe_35_reset),
    .io_ho_input(bc_pe_35_io_ho_input),
    .io_ve_input(bc_pe_35_io_ve_input),
    .io_input_valid(bc_pe_35_io_input_valid),
    .io_iormac(bc_pe_35_io_iormac),
    .io_ve_out(bc_pe_35_io_ve_out),
    .io_ho_out(bc_pe_35_io_ho_out),
    .io_res_out(bc_pe_35_io_res_out)
  );
  bc_pe bc_pe_36 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_36_clock),
    .reset(bc_pe_36_reset),
    .io_ho_input(bc_pe_36_io_ho_input),
    .io_ve_input(bc_pe_36_io_ve_input),
    .io_input_valid(bc_pe_36_io_input_valid),
    .io_iormac(bc_pe_36_io_iormac),
    .io_ve_out(bc_pe_36_io_ve_out),
    .io_ho_out(bc_pe_36_io_ho_out),
    .io_res_out(bc_pe_36_io_res_out)
  );
  bc_pe bc_pe_37 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_37_clock),
    .reset(bc_pe_37_reset),
    .io_ho_input(bc_pe_37_io_ho_input),
    .io_ve_input(bc_pe_37_io_ve_input),
    .io_input_valid(bc_pe_37_io_input_valid),
    .io_iormac(bc_pe_37_io_iormac),
    .io_ve_out(bc_pe_37_io_ve_out),
    .io_ho_out(bc_pe_37_io_ho_out),
    .io_res_out(bc_pe_37_io_res_out)
  );
  bc_pe bc_pe_38 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_38_clock),
    .reset(bc_pe_38_reset),
    .io_ho_input(bc_pe_38_io_ho_input),
    .io_ve_input(bc_pe_38_io_ve_input),
    .io_input_valid(bc_pe_38_io_input_valid),
    .io_iormac(bc_pe_38_io_iormac),
    .io_ve_out(bc_pe_38_io_ve_out),
    .io_ho_out(bc_pe_38_io_ho_out),
    .io_res_out(bc_pe_38_io_res_out)
  );
  bc_pe bc_pe_39 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_39_clock),
    .reset(bc_pe_39_reset),
    .io_ho_input(bc_pe_39_io_ho_input),
    .io_ve_input(bc_pe_39_io_ve_input),
    .io_input_valid(bc_pe_39_io_input_valid),
    .io_iormac(bc_pe_39_io_iormac),
    .io_ve_out(bc_pe_39_io_ve_out),
    .io_ho_out(bc_pe_39_io_ho_out),
    .io_res_out(bc_pe_39_io_res_out)
  );
  bc_pe bc_pe_40 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_40_clock),
    .reset(bc_pe_40_reset),
    .io_ho_input(bc_pe_40_io_ho_input),
    .io_ve_input(bc_pe_40_io_ve_input),
    .io_input_valid(bc_pe_40_io_input_valid),
    .io_iormac(bc_pe_40_io_iormac),
    .io_ve_out(bc_pe_40_io_ve_out),
    .io_ho_out(bc_pe_40_io_ho_out),
    .io_res_out(bc_pe_40_io_res_out)
  );
  bc_pe bc_pe_41 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_41_clock),
    .reset(bc_pe_41_reset),
    .io_ho_input(bc_pe_41_io_ho_input),
    .io_ve_input(bc_pe_41_io_ve_input),
    .io_input_valid(bc_pe_41_io_input_valid),
    .io_iormac(bc_pe_41_io_iormac),
    .io_ve_out(bc_pe_41_io_ve_out),
    .io_ho_out(bc_pe_41_io_ho_out),
    .io_res_out(bc_pe_41_io_res_out)
  );
  bc_pe bc_pe_42 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_42_clock),
    .reset(bc_pe_42_reset),
    .io_ho_input(bc_pe_42_io_ho_input),
    .io_ve_input(bc_pe_42_io_ve_input),
    .io_input_valid(bc_pe_42_io_input_valid),
    .io_iormac(bc_pe_42_io_iormac),
    .io_ve_out(bc_pe_42_io_ve_out),
    .io_ho_out(bc_pe_42_io_ho_out),
    .io_res_out(bc_pe_42_io_res_out)
  );
  bc_pe bc_pe_43 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_43_clock),
    .reset(bc_pe_43_reset),
    .io_ho_input(bc_pe_43_io_ho_input),
    .io_ve_input(bc_pe_43_io_ve_input),
    .io_input_valid(bc_pe_43_io_input_valid),
    .io_iormac(bc_pe_43_io_iormac),
    .io_ve_out(bc_pe_43_io_ve_out),
    .io_ho_out(bc_pe_43_io_ho_out),
    .io_res_out(bc_pe_43_io_res_out)
  );
  bc_pe bc_pe_44 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_44_clock),
    .reset(bc_pe_44_reset),
    .io_ho_input(bc_pe_44_io_ho_input),
    .io_ve_input(bc_pe_44_io_ve_input),
    .io_input_valid(bc_pe_44_io_input_valid),
    .io_iormac(bc_pe_44_io_iormac),
    .io_ve_out(bc_pe_44_io_ve_out),
    .io_ho_out(bc_pe_44_io_ho_out),
    .io_res_out(bc_pe_44_io_res_out)
  );
  bc_pe bc_pe_45 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_45_clock),
    .reset(bc_pe_45_reset),
    .io_ho_input(bc_pe_45_io_ho_input),
    .io_ve_input(bc_pe_45_io_ve_input),
    .io_input_valid(bc_pe_45_io_input_valid),
    .io_iormac(bc_pe_45_io_iormac),
    .io_ve_out(bc_pe_45_io_ve_out),
    .io_ho_out(bc_pe_45_io_ho_out),
    .io_res_out(bc_pe_45_io_res_out)
  );
  bc_pe bc_pe_46 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_46_clock),
    .reset(bc_pe_46_reset),
    .io_ho_input(bc_pe_46_io_ho_input),
    .io_ve_input(bc_pe_46_io_ve_input),
    .io_input_valid(bc_pe_46_io_input_valid),
    .io_iormac(bc_pe_46_io_iormac),
    .io_ve_out(bc_pe_46_io_ve_out),
    .io_ho_out(bc_pe_46_io_ho_out),
    .io_res_out(bc_pe_46_io_res_out)
  );
  bc_pe bc_pe_47 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_47_clock),
    .reset(bc_pe_47_reset),
    .io_ho_input(bc_pe_47_io_ho_input),
    .io_ve_input(bc_pe_47_io_ve_input),
    .io_input_valid(bc_pe_47_io_input_valid),
    .io_iormac(bc_pe_47_io_iormac),
    .io_ve_out(bc_pe_47_io_ve_out),
    .io_ho_out(bc_pe_47_io_ho_out),
    .io_res_out(bc_pe_47_io_res_out)
  );
  bc_pe bc_pe_48 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_48_clock),
    .reset(bc_pe_48_reset),
    .io_ho_input(bc_pe_48_io_ho_input),
    .io_ve_input(bc_pe_48_io_ve_input),
    .io_input_valid(bc_pe_48_io_input_valid),
    .io_iormac(bc_pe_48_io_iormac),
    .io_ve_out(bc_pe_48_io_ve_out),
    .io_ho_out(bc_pe_48_io_ho_out),
    .io_res_out(bc_pe_48_io_res_out)
  );
  bc_pe bc_pe_49 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_49_clock),
    .reset(bc_pe_49_reset),
    .io_ho_input(bc_pe_49_io_ho_input),
    .io_ve_input(bc_pe_49_io_ve_input),
    .io_input_valid(bc_pe_49_io_input_valid),
    .io_iormac(bc_pe_49_io_iormac),
    .io_ve_out(bc_pe_49_io_ve_out),
    .io_ho_out(bc_pe_49_io_ho_out),
    .io_res_out(bc_pe_49_io_res_out)
  );
  bc_pe bc_pe_50 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_50_clock),
    .reset(bc_pe_50_reset),
    .io_ho_input(bc_pe_50_io_ho_input),
    .io_ve_input(bc_pe_50_io_ve_input),
    .io_input_valid(bc_pe_50_io_input_valid),
    .io_iormac(bc_pe_50_io_iormac),
    .io_ve_out(bc_pe_50_io_ve_out),
    .io_ho_out(bc_pe_50_io_ho_out),
    .io_res_out(bc_pe_50_io_res_out)
  );
  bc_pe bc_pe_51 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_51_clock),
    .reset(bc_pe_51_reset),
    .io_ho_input(bc_pe_51_io_ho_input),
    .io_ve_input(bc_pe_51_io_ve_input),
    .io_input_valid(bc_pe_51_io_input_valid),
    .io_iormac(bc_pe_51_io_iormac),
    .io_ve_out(bc_pe_51_io_ve_out),
    .io_ho_out(bc_pe_51_io_ho_out),
    .io_res_out(bc_pe_51_io_res_out)
  );
  bc_pe bc_pe_52 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_52_clock),
    .reset(bc_pe_52_reset),
    .io_ho_input(bc_pe_52_io_ho_input),
    .io_ve_input(bc_pe_52_io_ve_input),
    .io_input_valid(bc_pe_52_io_input_valid),
    .io_iormac(bc_pe_52_io_iormac),
    .io_ve_out(bc_pe_52_io_ve_out),
    .io_ho_out(bc_pe_52_io_ho_out),
    .io_res_out(bc_pe_52_io_res_out)
  );
  bc_pe bc_pe_53 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_53_clock),
    .reset(bc_pe_53_reset),
    .io_ho_input(bc_pe_53_io_ho_input),
    .io_ve_input(bc_pe_53_io_ve_input),
    .io_input_valid(bc_pe_53_io_input_valid),
    .io_iormac(bc_pe_53_io_iormac),
    .io_ve_out(bc_pe_53_io_ve_out),
    .io_ho_out(bc_pe_53_io_ho_out),
    .io_res_out(bc_pe_53_io_res_out)
  );
  bc_pe bc_pe_54 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_54_clock),
    .reset(bc_pe_54_reset),
    .io_ho_input(bc_pe_54_io_ho_input),
    .io_ve_input(bc_pe_54_io_ve_input),
    .io_input_valid(bc_pe_54_io_input_valid),
    .io_iormac(bc_pe_54_io_iormac),
    .io_ve_out(bc_pe_54_io_ve_out),
    .io_ho_out(bc_pe_54_io_ho_out),
    .io_res_out(bc_pe_54_io_res_out)
  );
  bc_pe bc_pe_55 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_55_clock),
    .reset(bc_pe_55_reset),
    .io_ho_input(bc_pe_55_io_ho_input),
    .io_ve_input(bc_pe_55_io_ve_input),
    .io_input_valid(bc_pe_55_io_input_valid),
    .io_iormac(bc_pe_55_io_iormac),
    .io_ve_out(bc_pe_55_io_ve_out),
    .io_ho_out(bc_pe_55_io_ho_out),
    .io_res_out(bc_pe_55_io_res_out)
  );
  bc_pe bc_pe_56 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_56_clock),
    .reset(bc_pe_56_reset),
    .io_ho_input(bc_pe_56_io_ho_input),
    .io_ve_input(bc_pe_56_io_ve_input),
    .io_input_valid(bc_pe_56_io_input_valid),
    .io_iormac(bc_pe_56_io_iormac),
    .io_ve_out(bc_pe_56_io_ve_out),
    .io_ho_out(bc_pe_56_io_ho_out),
    .io_res_out(bc_pe_56_io_res_out)
  );
  bc_pe bc_pe_57 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_57_clock),
    .reset(bc_pe_57_reset),
    .io_ho_input(bc_pe_57_io_ho_input),
    .io_ve_input(bc_pe_57_io_ve_input),
    .io_input_valid(bc_pe_57_io_input_valid),
    .io_iormac(bc_pe_57_io_iormac),
    .io_ve_out(bc_pe_57_io_ve_out),
    .io_ho_out(bc_pe_57_io_ho_out),
    .io_res_out(bc_pe_57_io_res_out)
  );
  bc_pe bc_pe_58 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_58_clock),
    .reset(bc_pe_58_reset),
    .io_ho_input(bc_pe_58_io_ho_input),
    .io_ve_input(bc_pe_58_io_ve_input),
    .io_input_valid(bc_pe_58_io_input_valid),
    .io_iormac(bc_pe_58_io_iormac),
    .io_ve_out(bc_pe_58_io_ve_out),
    .io_ho_out(bc_pe_58_io_ho_out),
    .io_res_out(bc_pe_58_io_res_out)
  );
  bc_pe bc_pe_59 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_59_clock),
    .reset(bc_pe_59_reset),
    .io_ho_input(bc_pe_59_io_ho_input),
    .io_ve_input(bc_pe_59_io_ve_input),
    .io_input_valid(bc_pe_59_io_input_valid),
    .io_iormac(bc_pe_59_io_iormac),
    .io_ve_out(bc_pe_59_io_ve_out),
    .io_ho_out(bc_pe_59_io_ho_out),
    .io_res_out(bc_pe_59_io_res_out)
  );
  bc_pe bc_pe_60 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_60_clock),
    .reset(bc_pe_60_reset),
    .io_ho_input(bc_pe_60_io_ho_input),
    .io_ve_input(bc_pe_60_io_ve_input),
    .io_input_valid(bc_pe_60_io_input_valid),
    .io_iormac(bc_pe_60_io_iormac),
    .io_ve_out(bc_pe_60_io_ve_out),
    .io_ho_out(bc_pe_60_io_ho_out),
    .io_res_out(bc_pe_60_io_res_out)
  );
  bc_pe bc_pe_61 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_61_clock),
    .reset(bc_pe_61_reset),
    .io_ho_input(bc_pe_61_io_ho_input),
    .io_ve_input(bc_pe_61_io_ve_input),
    .io_input_valid(bc_pe_61_io_input_valid),
    .io_iormac(bc_pe_61_io_iormac),
    .io_ve_out(bc_pe_61_io_ve_out),
    .io_ho_out(bc_pe_61_io_ho_out),
    .io_res_out(bc_pe_61_io_res_out)
  );
  bc_pe bc_pe_62 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_62_clock),
    .reset(bc_pe_62_reset),
    .io_ho_input(bc_pe_62_io_ho_input),
    .io_ve_input(bc_pe_62_io_ve_input),
    .io_input_valid(bc_pe_62_io_input_valid),
    .io_iormac(bc_pe_62_io_iormac),
    .io_ve_out(bc_pe_62_io_ve_out),
    .io_ho_out(bc_pe_62_io_ho_out),
    .io_res_out(bc_pe_62_io_res_out)
  );
  bc_pe bc_pe_63 ( // @[bc_mmul.scala 23:11]
    .clock(bc_pe_63_clock),
    .reset(bc_pe_63_reset),
    .io_ho_input(bc_pe_63_io_ho_input),
    .io_ve_input(bc_pe_63_io_ve_input),
    .io_input_valid(bc_pe_63_io_input_valid),
    .io_iormac(bc_pe_63_io_iormac),
    .io_ve_out(bc_pe_63_io_ve_out),
    .io_ho_out(bc_pe_63_io_ho_out),
    .io_res_out(bc_pe_63_io_res_out)
  );
  assign io_out_0 = bc_pe_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_1 = bc_pe_1_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_2 = bc_pe_2_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_3 = bc_pe_3_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_4 = bc_pe_4_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_5 = bc_pe_5_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_6 = bc_pe_6_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_7 = bc_pe_7_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_8 = bc_pe_8_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_9 = bc_pe_9_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_10 = bc_pe_10_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_11 = bc_pe_11_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_12 = bc_pe_12_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_13 = bc_pe_13_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_14 = bc_pe_14_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_15 = bc_pe_15_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_16 = bc_pe_16_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_17 = bc_pe_17_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_18 = bc_pe_18_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_19 = bc_pe_19_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_20 = bc_pe_20_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_21 = bc_pe_21_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_22 = bc_pe_22_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_23 = bc_pe_23_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_24 = bc_pe_24_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_25 = bc_pe_25_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_26 = bc_pe_26_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_27 = bc_pe_27_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_28 = bc_pe_28_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_29 = bc_pe_29_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_30 = bc_pe_30_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_31 = bc_pe_31_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_32 = bc_pe_32_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_33 = bc_pe_33_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_34 = bc_pe_34_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_35 = bc_pe_35_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_36 = bc_pe_36_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_37 = bc_pe_37_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_38 = bc_pe_38_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_39 = bc_pe_39_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_40 = bc_pe_40_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_41 = bc_pe_41_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_42 = bc_pe_42_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_43 = bc_pe_43_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_44 = bc_pe_44_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_45 = bc_pe_45_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_46 = bc_pe_46_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_47 = bc_pe_47_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_48 = bc_pe_48_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_49 = bc_pe_49_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_50 = bc_pe_50_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_51 = bc_pe_51_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_52 = bc_pe_52_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_53 = bc_pe_53_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_54 = bc_pe_54_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_55 = bc_pe_55_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_56 = bc_pe_56_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_57 = bc_pe_57_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_58 = bc_pe_58_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_59 = bc_pe_59_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_60 = bc_pe_60_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_61 = bc_pe_61_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_62 = bc_pe_62_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign io_out_63 = bc_pe_63_io_res_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_clock = clock;
  assign bc_pe_reset = reset;
  assign bc_pe_io_ho_input = io_x_input_0; // @[bc_mmul.scala 22:28 38:42]
  assign bc_pe_io_ve_input = io_w_input_0; // @[bc_mmul.scala 22:28 37:42]
  assign bc_pe_io_input_valid = io_input_valid_0; // @[bc_mmul.scala 22:28 39:42]
  assign bc_pe_io_iormac = io_iormac_0; // @[bc_mmul.scala 22:28 40:42]
  assign bc_pe_1_clock = clock;
  assign bc_pe_1_reset = reset;
  assign bc_pe_1_io_ho_input = bc_pe_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_1_io_ve_input = io_w_input_1; // @[bc_mmul.scala 22:28 48:43]
  assign bc_pe_1_io_input_valid = io_input_valid_1; // @[bc_mmul.scala 22:28 50:43]
  assign bc_pe_1_io_iormac = io_iormac_1; // @[bc_mmul.scala 22:28 51:43]
  assign bc_pe_2_clock = clock;
  assign bc_pe_2_reset = reset;
  assign bc_pe_2_io_ho_input = bc_pe_1_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_2_io_ve_input = io_w_input_2; // @[bc_mmul.scala 22:28 48:43]
  assign bc_pe_2_io_input_valid = io_input_valid_2; // @[bc_mmul.scala 22:28 50:43]
  assign bc_pe_2_io_iormac = io_iormac_2; // @[bc_mmul.scala 22:28 51:43]
  assign bc_pe_3_clock = clock;
  assign bc_pe_3_reset = reset;
  assign bc_pe_3_io_ho_input = bc_pe_2_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_3_io_ve_input = io_w_input_3; // @[bc_mmul.scala 22:28 48:43]
  assign bc_pe_3_io_input_valid = io_input_valid_3; // @[bc_mmul.scala 22:28 50:43]
  assign bc_pe_3_io_iormac = io_iormac_3; // @[bc_mmul.scala 22:28 51:43]
  assign bc_pe_4_clock = clock;
  assign bc_pe_4_reset = reset;
  assign bc_pe_4_io_ho_input = bc_pe_3_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_4_io_ve_input = io_w_input_4; // @[bc_mmul.scala 22:28 48:43]
  assign bc_pe_4_io_input_valid = io_input_valid_4; // @[bc_mmul.scala 22:28 50:43]
  assign bc_pe_4_io_iormac = io_iormac_4; // @[bc_mmul.scala 22:28 51:43]
  assign bc_pe_5_clock = clock;
  assign bc_pe_5_reset = reset;
  assign bc_pe_5_io_ho_input = bc_pe_4_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_5_io_ve_input = io_w_input_5; // @[bc_mmul.scala 22:28 48:43]
  assign bc_pe_5_io_input_valid = io_input_valid_5; // @[bc_mmul.scala 22:28 50:43]
  assign bc_pe_5_io_iormac = io_iormac_5; // @[bc_mmul.scala 22:28 51:43]
  assign bc_pe_6_clock = clock;
  assign bc_pe_6_reset = reset;
  assign bc_pe_6_io_ho_input = bc_pe_5_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_6_io_ve_input = io_w_input_6; // @[bc_mmul.scala 22:28 48:43]
  assign bc_pe_6_io_input_valid = io_input_valid_6; // @[bc_mmul.scala 22:28 50:43]
  assign bc_pe_6_io_iormac = io_iormac_6; // @[bc_mmul.scala 22:28 51:43]
  assign bc_pe_7_clock = clock;
  assign bc_pe_7_reset = reset;
  assign bc_pe_7_io_ho_input = bc_pe_6_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_7_io_ve_input = io_w_input_7; // @[bc_mmul.scala 22:28 48:43]
  assign bc_pe_7_io_input_valid = io_input_valid_7; // @[bc_mmul.scala 22:28 50:43]
  assign bc_pe_7_io_iormac = io_iormac_7; // @[bc_mmul.scala 22:28 51:43]
  assign bc_pe_8_clock = clock;
  assign bc_pe_8_reset = reset;
  assign bc_pe_8_io_ho_input = io_x_input_1; // @[bc_mmul.scala 22:28 60:41]
  assign bc_pe_8_io_ve_input = bc_pe_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_8_io_input_valid = io_input_valid_8; // @[bc_mmul.scala 22:28 62:41]
  assign bc_pe_8_io_iormac = io_iormac_8; // @[bc_mmul.scala 22:28 63:41]
  assign bc_pe_9_clock = clock;
  assign bc_pe_9_reset = reset;
  assign bc_pe_9_io_ho_input = bc_pe_8_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_9_io_ve_input = bc_pe_1_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_9_io_input_valid = io_input_valid_9; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_9_io_iormac = io_iormac_9; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_10_clock = clock;
  assign bc_pe_10_reset = reset;
  assign bc_pe_10_io_ho_input = bc_pe_9_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_10_io_ve_input = bc_pe_2_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_10_io_input_valid = io_input_valid_10; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_10_io_iormac = io_iormac_10; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_11_clock = clock;
  assign bc_pe_11_reset = reset;
  assign bc_pe_11_io_ho_input = bc_pe_10_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_11_io_ve_input = bc_pe_3_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_11_io_input_valid = io_input_valid_11; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_11_io_iormac = io_iormac_11; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_12_clock = clock;
  assign bc_pe_12_reset = reset;
  assign bc_pe_12_io_ho_input = bc_pe_11_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_12_io_ve_input = bc_pe_4_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_12_io_input_valid = io_input_valid_12; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_12_io_iormac = io_iormac_12; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_13_clock = clock;
  assign bc_pe_13_reset = reset;
  assign bc_pe_13_io_ho_input = bc_pe_12_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_13_io_ve_input = bc_pe_5_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_13_io_input_valid = io_input_valid_13; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_13_io_iormac = io_iormac_13; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_14_clock = clock;
  assign bc_pe_14_reset = reset;
  assign bc_pe_14_io_ho_input = bc_pe_13_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_14_io_ve_input = bc_pe_6_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_14_io_input_valid = io_input_valid_14; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_14_io_iormac = io_iormac_14; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_15_clock = clock;
  assign bc_pe_15_reset = reset;
  assign bc_pe_15_io_ho_input = bc_pe_14_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_15_io_ve_input = bc_pe_7_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_15_io_input_valid = io_input_valid_15; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_15_io_iormac = io_iormac_15; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_16_clock = clock;
  assign bc_pe_16_reset = reset;
  assign bc_pe_16_io_ho_input = io_x_input_2; // @[bc_mmul.scala 22:28 60:41]
  assign bc_pe_16_io_ve_input = bc_pe_8_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_16_io_input_valid = io_input_valid_16; // @[bc_mmul.scala 22:28 62:41]
  assign bc_pe_16_io_iormac = io_iormac_16; // @[bc_mmul.scala 22:28 63:41]
  assign bc_pe_17_clock = clock;
  assign bc_pe_17_reset = reset;
  assign bc_pe_17_io_ho_input = bc_pe_16_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_17_io_ve_input = bc_pe_9_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_17_io_input_valid = io_input_valid_17; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_17_io_iormac = io_iormac_17; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_18_clock = clock;
  assign bc_pe_18_reset = reset;
  assign bc_pe_18_io_ho_input = bc_pe_17_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_18_io_ve_input = bc_pe_10_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_18_io_input_valid = io_input_valid_18; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_18_io_iormac = io_iormac_18; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_19_clock = clock;
  assign bc_pe_19_reset = reset;
  assign bc_pe_19_io_ho_input = bc_pe_18_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_19_io_ve_input = bc_pe_11_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_19_io_input_valid = io_input_valid_19; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_19_io_iormac = io_iormac_19; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_20_clock = clock;
  assign bc_pe_20_reset = reset;
  assign bc_pe_20_io_ho_input = bc_pe_19_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_20_io_ve_input = bc_pe_12_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_20_io_input_valid = io_input_valid_20; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_20_io_iormac = io_iormac_20; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_21_clock = clock;
  assign bc_pe_21_reset = reset;
  assign bc_pe_21_io_ho_input = bc_pe_20_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_21_io_ve_input = bc_pe_13_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_21_io_input_valid = io_input_valid_21; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_21_io_iormac = io_iormac_21; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_22_clock = clock;
  assign bc_pe_22_reset = reset;
  assign bc_pe_22_io_ho_input = bc_pe_21_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_22_io_ve_input = bc_pe_14_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_22_io_input_valid = io_input_valid_22; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_22_io_iormac = io_iormac_22; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_23_clock = clock;
  assign bc_pe_23_reset = reset;
  assign bc_pe_23_io_ho_input = bc_pe_22_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_23_io_ve_input = bc_pe_15_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_23_io_input_valid = io_input_valid_23; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_23_io_iormac = io_iormac_23; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_24_clock = clock;
  assign bc_pe_24_reset = reset;
  assign bc_pe_24_io_ho_input = io_x_input_3; // @[bc_mmul.scala 22:28 60:41]
  assign bc_pe_24_io_ve_input = bc_pe_16_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_24_io_input_valid = io_input_valid_24; // @[bc_mmul.scala 22:28 62:41]
  assign bc_pe_24_io_iormac = io_iormac_24; // @[bc_mmul.scala 22:28 63:41]
  assign bc_pe_25_clock = clock;
  assign bc_pe_25_reset = reset;
  assign bc_pe_25_io_ho_input = bc_pe_24_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_25_io_ve_input = bc_pe_17_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_25_io_input_valid = io_input_valid_25; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_25_io_iormac = io_iormac_25; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_26_clock = clock;
  assign bc_pe_26_reset = reset;
  assign bc_pe_26_io_ho_input = bc_pe_25_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_26_io_ve_input = bc_pe_18_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_26_io_input_valid = io_input_valid_26; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_26_io_iormac = io_iormac_26; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_27_clock = clock;
  assign bc_pe_27_reset = reset;
  assign bc_pe_27_io_ho_input = bc_pe_26_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_27_io_ve_input = bc_pe_19_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_27_io_input_valid = io_input_valid_27; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_27_io_iormac = io_iormac_27; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_28_clock = clock;
  assign bc_pe_28_reset = reset;
  assign bc_pe_28_io_ho_input = bc_pe_27_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_28_io_ve_input = bc_pe_20_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_28_io_input_valid = io_input_valid_28; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_28_io_iormac = io_iormac_28; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_29_clock = clock;
  assign bc_pe_29_reset = reset;
  assign bc_pe_29_io_ho_input = bc_pe_28_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_29_io_ve_input = bc_pe_21_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_29_io_input_valid = io_input_valid_29; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_29_io_iormac = io_iormac_29; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_30_clock = clock;
  assign bc_pe_30_reset = reset;
  assign bc_pe_30_io_ho_input = bc_pe_29_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_30_io_ve_input = bc_pe_22_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_30_io_input_valid = io_input_valid_30; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_30_io_iormac = io_iormac_30; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_31_clock = clock;
  assign bc_pe_31_reset = reset;
  assign bc_pe_31_io_ho_input = bc_pe_30_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_31_io_ve_input = bc_pe_23_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_31_io_input_valid = io_input_valid_31; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_31_io_iormac = io_iormac_31; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_32_clock = clock;
  assign bc_pe_32_reset = reset;
  assign bc_pe_32_io_ho_input = io_x_input_4; // @[bc_mmul.scala 22:28 60:41]
  assign bc_pe_32_io_ve_input = bc_pe_24_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_32_io_input_valid = io_input_valid_32; // @[bc_mmul.scala 22:28 62:41]
  assign bc_pe_32_io_iormac = io_iormac_32; // @[bc_mmul.scala 22:28 63:41]
  assign bc_pe_33_clock = clock;
  assign bc_pe_33_reset = reset;
  assign bc_pe_33_io_ho_input = bc_pe_32_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_33_io_ve_input = bc_pe_25_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_33_io_input_valid = io_input_valid_33; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_33_io_iormac = io_iormac_33; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_34_clock = clock;
  assign bc_pe_34_reset = reset;
  assign bc_pe_34_io_ho_input = bc_pe_33_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_34_io_ve_input = bc_pe_26_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_34_io_input_valid = io_input_valid_34; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_34_io_iormac = io_iormac_34; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_35_clock = clock;
  assign bc_pe_35_reset = reset;
  assign bc_pe_35_io_ho_input = bc_pe_34_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_35_io_ve_input = bc_pe_27_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_35_io_input_valid = io_input_valid_35; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_35_io_iormac = io_iormac_35; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_36_clock = clock;
  assign bc_pe_36_reset = reset;
  assign bc_pe_36_io_ho_input = bc_pe_35_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_36_io_ve_input = bc_pe_28_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_36_io_input_valid = io_input_valid_36; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_36_io_iormac = io_iormac_36; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_37_clock = clock;
  assign bc_pe_37_reset = reset;
  assign bc_pe_37_io_ho_input = bc_pe_36_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_37_io_ve_input = bc_pe_29_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_37_io_input_valid = io_input_valid_37; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_37_io_iormac = io_iormac_37; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_38_clock = clock;
  assign bc_pe_38_reset = reset;
  assign bc_pe_38_io_ho_input = bc_pe_37_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_38_io_ve_input = bc_pe_30_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_38_io_input_valid = io_input_valid_38; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_38_io_iormac = io_iormac_38; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_39_clock = clock;
  assign bc_pe_39_reset = reset;
  assign bc_pe_39_io_ho_input = bc_pe_38_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_39_io_ve_input = bc_pe_31_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_39_io_input_valid = io_input_valid_39; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_39_io_iormac = io_iormac_39; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_40_clock = clock;
  assign bc_pe_40_reset = reset;
  assign bc_pe_40_io_ho_input = io_x_input_5; // @[bc_mmul.scala 22:28 60:41]
  assign bc_pe_40_io_ve_input = bc_pe_32_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_40_io_input_valid = io_input_valid_40; // @[bc_mmul.scala 22:28 62:41]
  assign bc_pe_40_io_iormac = io_iormac_40; // @[bc_mmul.scala 22:28 63:41]
  assign bc_pe_41_clock = clock;
  assign bc_pe_41_reset = reset;
  assign bc_pe_41_io_ho_input = bc_pe_40_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_41_io_ve_input = bc_pe_33_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_41_io_input_valid = io_input_valid_41; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_41_io_iormac = io_iormac_41; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_42_clock = clock;
  assign bc_pe_42_reset = reset;
  assign bc_pe_42_io_ho_input = bc_pe_41_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_42_io_ve_input = bc_pe_34_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_42_io_input_valid = io_input_valid_42; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_42_io_iormac = io_iormac_42; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_43_clock = clock;
  assign bc_pe_43_reset = reset;
  assign bc_pe_43_io_ho_input = bc_pe_42_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_43_io_ve_input = bc_pe_35_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_43_io_input_valid = io_input_valid_43; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_43_io_iormac = io_iormac_43; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_44_clock = clock;
  assign bc_pe_44_reset = reset;
  assign bc_pe_44_io_ho_input = bc_pe_43_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_44_io_ve_input = bc_pe_36_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_44_io_input_valid = io_input_valid_44; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_44_io_iormac = io_iormac_44; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_45_clock = clock;
  assign bc_pe_45_reset = reset;
  assign bc_pe_45_io_ho_input = bc_pe_44_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_45_io_ve_input = bc_pe_37_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_45_io_input_valid = io_input_valid_45; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_45_io_iormac = io_iormac_45; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_46_clock = clock;
  assign bc_pe_46_reset = reset;
  assign bc_pe_46_io_ho_input = bc_pe_45_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_46_io_ve_input = bc_pe_38_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_46_io_input_valid = io_input_valid_46; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_46_io_iormac = io_iormac_46; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_47_clock = clock;
  assign bc_pe_47_reset = reset;
  assign bc_pe_47_io_ho_input = bc_pe_46_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_47_io_ve_input = bc_pe_39_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_47_io_input_valid = io_input_valid_47; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_47_io_iormac = io_iormac_47; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_48_clock = clock;
  assign bc_pe_48_reset = reset;
  assign bc_pe_48_io_ho_input = io_x_input_6; // @[bc_mmul.scala 22:28 60:41]
  assign bc_pe_48_io_ve_input = bc_pe_40_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_48_io_input_valid = io_input_valid_48; // @[bc_mmul.scala 22:28 62:41]
  assign bc_pe_48_io_iormac = io_iormac_48; // @[bc_mmul.scala 22:28 63:41]
  assign bc_pe_49_clock = clock;
  assign bc_pe_49_reset = reset;
  assign bc_pe_49_io_ho_input = bc_pe_48_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_49_io_ve_input = bc_pe_41_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_49_io_input_valid = io_input_valid_49; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_49_io_iormac = io_iormac_49; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_50_clock = clock;
  assign bc_pe_50_reset = reset;
  assign bc_pe_50_io_ho_input = bc_pe_49_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_50_io_ve_input = bc_pe_42_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_50_io_input_valid = io_input_valid_50; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_50_io_iormac = io_iormac_50; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_51_clock = clock;
  assign bc_pe_51_reset = reset;
  assign bc_pe_51_io_ho_input = bc_pe_50_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_51_io_ve_input = bc_pe_43_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_51_io_input_valid = io_input_valid_51; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_51_io_iormac = io_iormac_51; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_52_clock = clock;
  assign bc_pe_52_reset = reset;
  assign bc_pe_52_io_ho_input = bc_pe_51_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_52_io_ve_input = bc_pe_44_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_52_io_input_valid = io_input_valid_52; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_52_io_iormac = io_iormac_52; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_53_clock = clock;
  assign bc_pe_53_reset = reset;
  assign bc_pe_53_io_ho_input = bc_pe_52_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_53_io_ve_input = bc_pe_45_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_53_io_input_valid = io_input_valid_53; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_53_io_iormac = io_iormac_53; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_54_clock = clock;
  assign bc_pe_54_reset = reset;
  assign bc_pe_54_io_ho_input = bc_pe_53_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_54_io_ve_input = bc_pe_46_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_54_io_input_valid = io_input_valid_54; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_54_io_iormac = io_iormac_54; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_55_clock = clock;
  assign bc_pe_55_reset = reset;
  assign bc_pe_55_io_ho_input = bc_pe_54_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_55_io_ve_input = bc_pe_47_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_55_io_input_valid = io_input_valid_55; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_55_io_iormac = io_iormac_55; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_56_clock = clock;
  assign bc_pe_56_reset = reset;
  assign bc_pe_56_io_ho_input = io_x_input_7; // @[bc_mmul.scala 22:28 60:41]
  assign bc_pe_56_io_ve_input = bc_pe_48_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_56_io_input_valid = io_input_valid_56; // @[bc_mmul.scala 22:28 62:41]
  assign bc_pe_56_io_iormac = io_iormac_56; // @[bc_mmul.scala 22:28 63:41]
  assign bc_pe_57_clock = clock;
  assign bc_pe_57_reset = reset;
  assign bc_pe_57_io_ho_input = bc_pe_56_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_57_io_ve_input = bc_pe_49_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_57_io_input_valid = io_input_valid_57; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_57_io_iormac = io_iormac_57; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_58_clock = clock;
  assign bc_pe_58_reset = reset;
  assign bc_pe_58_io_ho_input = bc_pe_57_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_58_io_ve_input = bc_pe_50_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_58_io_input_valid = io_input_valid_58; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_58_io_iormac = io_iormac_58; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_59_clock = clock;
  assign bc_pe_59_reset = reset;
  assign bc_pe_59_io_ho_input = bc_pe_58_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_59_io_ve_input = bc_pe_51_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_59_io_input_valid = io_input_valid_59; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_59_io_iormac = io_iormac_59; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_60_clock = clock;
  assign bc_pe_60_reset = reset;
  assign bc_pe_60_io_ho_input = bc_pe_59_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_60_io_ve_input = bc_pe_52_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_60_io_input_valid = io_input_valid_60; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_60_io_iormac = io_iormac_60; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_61_clock = clock;
  assign bc_pe_61_reset = reset;
  assign bc_pe_61_io_ho_input = bc_pe_60_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_61_io_ve_input = bc_pe_53_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_61_io_input_valid = io_input_valid_61; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_61_io_iormac = io_iormac_61; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_62_clock = clock;
  assign bc_pe_62_reset = reset;
  assign bc_pe_62_io_ho_input = bc_pe_61_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_62_io_ve_input = bc_pe_54_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_62_io_input_valid = io_input_valid_62; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_62_io_iormac = io_iormac_62; // @[bc_mmul.scala 22:28 78:47]
  assign bc_pe_63_clock = clock;
  assign bc_pe_63_reset = reset;
  assign bc_pe_63_io_ho_input = bc_pe_62_io_ho_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_63_io_ve_input = bc_pe_55_io_ve_out; // @[bc_mmul.scala 22:{28,28}]
  assign bc_pe_63_io_input_valid = io_input_valid_63; // @[bc_mmul.scala 22:28 77:47]
  assign bc_pe_63_io_iormac = io_iormac_63; // @[bc_mmul.scala 22:28 78:47]
endmodule
