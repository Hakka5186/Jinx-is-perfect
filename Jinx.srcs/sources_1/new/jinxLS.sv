`timescale 1ns / 1ps
`include "define.svh"


module jinxLS(
    input clk,
    input rst,
    
    output Word_t inst_addr_o,
    input Word_t inst_data_i
    );

// wires in if
Word_t if_pc;
pc _pc(
    .clk(clk),
    .rst(rst),
    .pc(if_pc)
    );
assign inst_addr_o = if_pc;

//wires in id
Word_t id_pc,id_inst;
Word_t id_rdata1,id_rdata2,id_rdata1_o,id_rdata2_o;
RegAddr_t id_raddr1,id_raddr2,id_waddr;
Bit_t id_we;
InstOp_t id_instop;
Imm_t id_immport;
if_id _if_id(
    .clk(clk),
    .rst(rst),
    .if_pc(if_pc),
    .if_inst(inst_data_i),

    .id_pc(id_pc),
    .id_inst(id_inst)
    );

id _id(
    .clk(clk),
    .rst(rst),

    .pc_i(id_pc),
    .inst_i(id_inst),

    //输出到reg的地�??
    .raddr1_o(id_raddr1),
    .raddr2_o(id_raddr2),

    //reg返回的数�??
    .rdata1_i(id_rdata1),
    .rdata2_i(id_rdata2),

    //输出到下�??阶段的信�??
    .rdata1_o(id_rdata1_o),
    .rdata2_o(id_rdata2_o),
    .immport_o(id_immport),
    .waddr_o(id_waddr),
    .we_o(id_we),
    .instop_o(id_instop)
    );

//in exe
Word_t exe_pc,exe_inst;
Word_t exe_rdata1,exe_rdata2;
RegAddr_t exe_raddr1,exe_raddr2,exe_waddr;
Bit_t exe_we;
InstOp_t exe_instop;
RegWrite_t exe_wport;
Imm_t exe_immport;
id_exe _id_exe(
    .clk(clk),
    .rst(rst),

    .id_instop(id_instop),
    .id_rdata1(id_rdata1_o),
    .id_rdata2(id_rdata2_o),
    .id_waddr(id_waddr),
    .id_immport(id_immport),
    .id_we(id_we),
    
    .exe_instop(exe_instop),
    .exe_rdata1(exe_rdata1),
    .exe_rdata2(exe_rdata2),
    .exe_waddr(exe_waddr),
    .exe_immport(exe_immport),
    .exe_we(exe_we)
    
    );

exe _exe(
    .clk(clk),
    .rst(rst),
    
    .instop_i(exe_instop),
    .rdata1_i(exe_rdata1),
    .rdata2_i(exe_rdata2),
    .waddr_i(exe_waddr),
    .we_i(exe_we),
    .immport_i(exe_immport),

    .wport_o(exe_wport)
    );

RegWrite_t mem_wport,mem_wport_o;
exe_mem _exe_mem(
    .clk(clk),
    .rst(rst),

    .exe_wport(exe_wport),
    .mem_wport(mem_wport)
    );

mem _mem(
    .rst(rst),
    
    .wport_i(mem_wport),
    .wport_o(mem_wport_o)
    );

RegWrite_t wb_wport;
mem_wb _mem_wb(
    .clk(clk),
    .rst(rst),
    
    .mem_wport(mem_wport_o),
    .wb_wport(wb_wport)
    );

regfile _regfile(
    .clk(clk),
    .rst(rst),
    
    //二读�??�??
    .raddr1(id_raddr1),
    .rdata1(id_rdata1),

    .raddr2(id_raddr2),
    .rdata2(id_rdata2),

    .wport(wb_wport)
    );

endmodule
