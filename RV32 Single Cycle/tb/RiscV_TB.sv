`timescale 1ns / 1ps

module RiscV_TB;

  logic clk, reset;
  logic [1:0] flag;
  logic [31:0] instr, memWdata, addr, pc, aluIn1, aluIn2, Simm, Jimm, Bimm, Iimm, memRdata;
  logic [4:0] rs1Id, rs2Id, rdId, leds;
  logic [3:0] memWMask, aluControl;
  logic
      isALUreg,
      regWrite,
      isJAL,
      isJALR,
      isBranch,
      isLUI,
      isAUIPC,
      isALUimm,
      isLoad,
      isStore,
      isShamt;

  RiscV dut (
      clk,
      reset,
      pc,
      instr,
      memWdata,
      addr,
      aluIn1,
      aluIn2,
      Simm,
      Jimm,
      Bimm,
      Iimm,
      memRdata,
      rs1Id,
      rs2Id,
      rdId,
      memWMask,
      aluControl,
      isALUreg,
      regWrite,
      isJAL,
      isJALR,
      isBranch,
      isLUI,
      isAUIPC,
      isALUimm,
      isLoad,
      isStore,
      isShamt,
      leds
  );

  initial begin
    flag  = 0;
    reset = 1;
    #15;
    reset = 0;
    #2;
  end

  always begin
    clk <= 1;
    #5;
    clk <= 0;
    #5;
  end

  always @(negedge clk) begin
    if (pc == 8'h2c && leds == 5'he) flag = 1;
    if (rdId == 8'h1e && addr == 8'h36 && flag) flag = flag + 1;
    if (rdId == 8'h0 && flag == 2'b10) $finish;
  end

endmodule
