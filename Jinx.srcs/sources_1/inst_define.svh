`ifndef INST_DEFINE_SVH
`define INST_DEFINE_SVH

`define INST_3R(op, rk, rj, rdest, we) \
begin \
	instop_o = op; \
	raddr1_o = rj; \
    raddr2_o = rk; \
	waddr_o = rdest; \
	we_o = we; \
end

`define INST_2RI12(op, i12, rj, rdest, we) \
begin \
	instop_o = op; \
	raddr1_o = rj; \
	waddr_o = rdest; \
	we_o = we; \
	immport_o.en = `ENABLE; \
	immport_o.data = i12; \
end

typedef logic [21:0] OPCODE_2R_t;
typedef logic [16:0] OPCODE_3R_t;
typedef logic [11:0] OPCODE_4R_t;
typedef logic [9:0] OPCODE_2RI12_t;
typedef logic [11:0] Imm12_t;

`define OR_OPCODE 16'b0000_0000_0010_1010
`define ORI_OPCODE 10'b0000_0011_10

`endif