`timescale 1ns / 1ps
`include "define.svh"


module Jinx(
    input clk,
    input rst
    );

Word_t inst_addr,inst_data;

jinxLS _jinx(
    .clk(clk),
    .rst(rst),
    .inst_addr_o(inst_addr),
    .inst_data_i(inst_data)
);

inst_rom _inst_rom(
    .addr(inst_addr),
    .data(inst_data)
);

endmodule
