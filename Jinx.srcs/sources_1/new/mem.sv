`timescale 1ns / 1ps
`include "define.svh"


module mem(
    input rst,
    
    input RegWrite_t wport_i,
    output RegWrite_t wport_o
    );

always_comb begin : blockName
    if(rst)begin
        wport_o.en = `DISABLE;
        wport_o.addr = `REG_ZERO_ADDR;
    end else begin
        wport_o = wport_i;
    end
end

endmodule
