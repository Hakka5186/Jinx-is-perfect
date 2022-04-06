`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/05 16:40:56
// Design Name: 
// Module Name: stage1_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module stage1_test();
reg clk;
reg rst;
initial begin
clk = 0;
rst = 1;
#100;
rst = 0;
forever #10 clk = ~clk;
end

Jinx jinx_test(
    .clk(clk),
    .rst(rst)
);
endmodule
