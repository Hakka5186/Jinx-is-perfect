`timescale 1ns / 1ps
`include "define.svh"
`include "inst_define.svh"

module exe(
    input clk,
    input rst,
    
    input InstOp_t instop_i,
    input Word_t rdata1_i,
    input Word_t rdata2_i,
    input RegAddr_t waddr_i,
    input Bit_t we_i,
    input Imm_t immport_i,

    output RegWrite_t wport_o
    );

Word_t res;
Bit_t we;
assign wport_o.addr = waddr_i;
assign wport_o.en = we;
assign wport_o.data = res;

//先直接按照instop计算，之后再拆成instop->aluop
always_comb begin : blockName
    if(rst)begin
        we =  `DISABLE;
        res = `ZERO_WORD;
    end else begin
        we = we_i;
        unique case(instop_i)
            OR: begin
                res = rdata1_i | rdata2_i;
            end
            ORI:begin
                res = rdata1_i | immport_i.data;
            end
            NOP:begin
                res = `ZERO_WORD;
            end
            default:begin
                res = `ZERO_WORD;
            end
        endcase
    end
end

endmodule

