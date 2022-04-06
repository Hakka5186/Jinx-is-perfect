`timescale 1ns / 1ps
`include "define.svh"
`include "rom_define.svh"


module inst_rom(
    input Word_t addr,
    output Word_t data
    );
reg[`MEM_DATA_WIDTH-1 : 0] mem[0 : `INST_ROM_NUM-1];
initial $readmemh ("C:\\Users\\15426\\Desktop\\data_factory\\inst_rom.data", mem);


logic [`INST_ROM_INDEX-1 : 0] index;
assign index = addr[`INST_ROM_INDEX+1 : 2];

always_comb begin : data_out
    data = mem[index];
end
endmodule