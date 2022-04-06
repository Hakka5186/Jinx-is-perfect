`timescale 1ns / 1ps
`include "define.svh"


module exe_mem(
    input clk,
    input rst,

    input RegWrite_t exe_wport,
    output RegWrite_t mem_wport
    );

always_ff @( clk ) begin : blockName
    if(rst)begin
        mem_wport.en <= `DISABLE;
    end else begin
        mem_wport<= exe_wport;
    end
end
endmodule
