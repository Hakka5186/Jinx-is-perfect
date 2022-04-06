`timescale 1ns / 1ps
`include "define.svh"


module regfile(
    input clk,
    input rst,
    
    //二读�?�?
    input RegAddr_t raddr1,
    output Word_t rdata1,

    input RegAddr_t raddr2,
    output Word_t rdata2,

    input RegWrite_t wport
    );

reg[`REG_DATA_WIDTH-1:0] registers[0:`REG_NUM-1];

always_ff @( clk ) begin : blockName
    if(rst)begin
        //全部寄存器清�?
        registers[0] = 32'h00000000;
        registers[1] = 32'h00000000;
        registers[2] = 32'h00000000;
        registers[3] = 32'h00000000;
        registers[4] = 32'h00000000;
        registers[5] = 32'h00000000;
        registers[6] = 32'h00000000;
        registers[7] = 32'h00000000;
        registers[8] = 32'h00000000;
        registers[9] = 32'h00000000;
        registers[10] = 32'h00000000;
        registers[11] = 32'h00000000;
        registers[12] = 32'h00000000;
        registers[13] = 32'h00000000;
        registers[14] = 32'h00000000;
        registers[15] = 32'h00000000;
        registers[16] = 32'h00000000;
        registers[17] = 32'h00000000;
        registers[18] = 32'h00000000;
        registers[19] = 32'h00000000;
        registers[20] = 32'h00000000;
        registers[21] = 32'h00000000;
        registers[22] = 32'h00000000;
        registers[23] = 32'h00000000;
        registers[24] = 32'h00000000;
        registers[25] = 32'h00000000;
        registers[26] = 32'h00000000;
        registers[27] = 32'h00000000;
        registers[28] = 32'h00000000;
        registers[29] = 32'h00000000;
        registers[30] = 32'h00000000;
        registers[31] = 32'h00000000;
    end else if(wport.en) begin
        //写操�?
        registers[wport.addr] <= wport.data;
    end
end

always_comb begin : read1
    if(rst)
        rdata1 <= `ZERO_WORD;
    else if (raddr1 == `REG_ZERO_ADDR)
        rdata1 <= `ZERO_WORD;
    else if ((raddr1 == wport.addr) && (wport.en))
        rdata1 <= wport.data; //做写数据前传
    else
        rdata1 <= registers[raddr1];
end

always_comb begin : read2
    if(rst)
        rdata2 <= `ZERO_WORD;
    else if (raddr2 == `REG_ZERO_ADDR)
        rdata2 <= `ZERO_WORD;
    else if ((raddr2 == wport.addr) && (wport.en))
        rdata2 <= wport.data; //做写数据前传
    else
        rdata2 <= registers[raddr2];
end
endmodule
