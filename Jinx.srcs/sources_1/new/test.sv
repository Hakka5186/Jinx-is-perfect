`timescale 1ns / 1ps
`include "define.svh"


module pc(
    input clk,
    input rst,
    output Word_t pc,
    );

always_ff @( clk ) begin : blockName
    if(rst)begin

    end else begin

    end
end
endmodule
