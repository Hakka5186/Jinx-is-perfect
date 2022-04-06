`timescale 1ns / 1ps
`include "define.svh"


module mem_wb(
    input clk,
    input rst,
    
    input RegWrite_t mem_wport,
    output RegWrite_t wb_wport
    );

   
always_ff @( clk ) begin : blockName
    if(rst)begin
        wb_wport.en <= `DISABLE;
    end else begin
       wb_wport <= mem_wport;
    end
end
endmodule
