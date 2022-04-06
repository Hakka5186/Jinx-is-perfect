`timescale 1ns / 1ps
`include "define.svh"
`include "inst_define.svh"

/*
输入：pc、指令数�?
输出：指令类型�?�操作类型�?�原操作�?*2、写入目标寄存器
*/
module id(
    input clk,
    input rst,

    input Word_t pc_i,
    input Word_t inst_i,

    //输出到reg的地�?
    output RegAddr_t raddr1_o,
    output RegAddr_t raddr2_o,

    //reg返回的数�?
    input Word_t rdata1_i,
    input Word_t rdata2_i,

    //输出到下�?阶段的信�?
    output Word_t rdata1_o,
    output Word_t rdata2_o,
    output Imm_t immport_o,
    output RegAddr_t waddr_o,
    output Bit_t we_o,
    output InstOp_t instop_o
    );

RegAddr_t r1,r2,rd;
OPCODE_2R_t op2r;
OPCODE_3R_t op3r;
OPCODE_4R_t op4r;
OPCODE_2RI12_t op2ri12;
assign rd = inst_i[4:0];
assign r1 = inst_i[9:5];
assign r2 = inst_i[14:10];
assign op3r = inst_i[31:15];
assign op2ri12 = inst_i[31:22];
Imm12_t imm12 ;
assign imm12 = inst_i[21:10];
Word_t imm;

always_comb begin : to_regs
    rdata1_o = rdata1_i;
    rdata2_o = rdata2_i;
end

always_comb begin : blockName
    if(rst)begin
        `INST_3R(NOP,5'b0,5'b0,5'b0,`DISABLE)
    end
    else begin
        immport_o.en = `DISABLE;
        case(op2ri12)
            10'b0:begin
                case(op3r)
                    `OR_OPCODE:`INST_3R(OR,r2,r1,rd,`ENABLE)
                    default : `INST_3R(NOP,5'b0,5'b0,5'b0,`DISABLE)
                endcase
            end
            `ORI_OPCODE:begin
                imm = {20'b0,imm12};
                `INST_2RI12(ORI,imm,r1,rd,`ENABLE)
            end
        endcase
    end
end
endmodule
