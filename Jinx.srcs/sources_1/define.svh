`ifndef DEFINE_SVH
`define DEFINE_SVH

//����????
`define ZERO_BIT        1'b0
`define ZERO_BYTE       8'h0
`define ZERO_HALF      16'h0
`define ZERO_WORD       32'h0
`define ZERO_DOUBLE      64'h0

//��_t��β�ľ�Ϊ�Դ�����
typedef logic           Bit_t;
typedef logic [7:0]     Byte_t;
typedef logic [15:0]    Half_t;
typedef logic [31:0]    Word_t;
typedef logic [63:0]    Double_t;

//�Ĵ�����??
`define REG_NUM        32
`define REG_ADDR_WIDTH 5
`define REG_DATA_WIDTH 32
`define REG_ZERO_ADDR 5'b00000
typedef logic [`REG_ADDR_WIDTH - 1:0] RegAddr_t;

typedef struct packed {
    Bit_t en;
    RegAddr_t addr;
    Word_t data;
} RegWrite_t;
typedef struct packed {
    Bit_t en;
    Word_t data;
} Imm_t;

//�����ź�
`define ENABLE 1'b1
`define DISABLE 1'b0
`define VALID 1'b1
`define INVALID 1'b0
`define TRUE 1'b1
`define FALSE 1'b0

//ָ�����
`define START_ADDR 32'h80000000
`define MEM_ADDR_WIDTH 32
`define MEM_DATA_WIDTH 32
typedef enum { 
    NOP,
    //??������ָ??
    OR,
    ORI
} InstOp_t;

`endif
