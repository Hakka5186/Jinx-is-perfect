`timescale 1ns / 1ps
`include "define.svh"

module pc(
    input clk,
    input rst,
    output Word_t pc
    );

always_ff @( clk ) begin : blockName
    if(rst)begin
        pc <= `START_ADDR;
    end else begin
        pc <= pc + 'h4;
    end
end

endmodule
