`timescale 1ns / 1ps
`include "define.svh"

module if_id(
    input clk,
    input rst,
    input Word_t if_pc,
    input Word_t if_inst,

    output Word_t id_pc,
    output Word_t id_inst
    );

always_ff @( clk ) begin : blockName
    if(rst)begin
        id_pc <= `START_ADDR;
        id_inst <= `ZERO_WORD;
    end else begin
        id_pc <= if_pc;
        id_inst <= if_inst;
    end
end

endmodule