`timescale 1ns / 1ps
`include "define.svh"
`include "inst_define.svh"

module id_exe(
    input clk,
    input rst,

    input InstOp_t id_instop,
    input Word_t id_rdata1,
    input Word_t id_rdata2,
    input RegAddr_t id_waddr,
    input Imm_t id_immport,
    input Bit_t id_we,
    
    output InstOp_t exe_instop,
    output Word_t exe_rdata1,
    output Word_t exe_rdata2,
    output RegAddr_t exe_waddr,
    output Imm_t exe_immport,
    output Bit_t exe_we
    
    );

always_ff @( clk ) begin : blockName
    if(rst)begin
        exe_instop <= NOP;
        exe_rdata1 <= `ZERO_WORD;
        exe_rdata2 <= `ZERO_WORD;
        exe_waddr <= `REG_ZERO_ADDR;
        exe_we <= `DISABLE;
        exe_immport.en <= `DISABLE;
    end else begin
        exe_instop <= id_instop;
        exe_rdata1 <= id_rdata1;
        exe_rdata2 <= id_rdata2;
        exe_waddr <= id_waddr;
        exe_we <= id_we;
        exe_immport <= id_immport;
    end
end
endmodule
