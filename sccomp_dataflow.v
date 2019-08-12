`timescale 1ns / 1ps
module sccomp_dataflow(
    input clk_in,
    input reset,
//    output [31:0] pc
    output [7:0] o_seg,
	output [7:0] o_sel
    );
    wire [31:0] inst,pc;
    wire clk, vga_clk, dm_wena;    
    wire [31:0] dm_addr, dm_wdata, dm_rdata;
    wire [31:0] real_pc, real_dm_addr; 
    assign real_pc      = (pc      - 32'h00400000) >> 2;
    assign real_dm_addr = (dm_addr - 32'h10010000) >> 2;

    wire [159:0] reg_two_six;
    
    /////////////////------------------------------test
    wire [3 :0] aluc;                               //
    wire [31:0] alu_a, alu_b, alu_result;           //
    wire rf_w;                                      //
    wire [4 :0] rf_waddr;                           //
    wire [31:0] rf_rdata1, rf_rdata2, rf_wdata;     //
    wire [2 :0] mdc;                                //
    wire [63:0] mul_result;                         //
    wire [31:0] hi, lo;                             //
    wire [31:0] zero_num;                           //
    /////////////////------------------------------test

    clk_divider cpu_clk (//10MHZ
        . rate(10), //10 times
        . reset(reset),. clk_in(clk_in),. clk(clk));

    cpu sccpu( 
        . clk(clk),
        . reset(reset),
        . inst(inst), . pc(pc),
        . dm_wena(dm_wena)  ,. dm_addr(dm_addr),
        . dm_rdata(dm_rdata),. dm_wdata(dm_wdata),
        . aluc(aluc),. alu_a(alu_a),. alu_b(alu_b),. alu_result(alu_result),
        . rf_w(rf_w),. rf_waddr(rf_waddr),. rf_rdata1(rf_rdata1),. rf_rdata2(rf_rdata2), . rf_wdata(rf_wdata),
        . mdc(mdc),. mul_result(mul_result),. hi(hi),. lo(lo),. zero_num(zero_num),
        . reg_two_six (reg_two_six) );    

    imem imem (. a(real_pc[10:0]), . spo(inst));         
              
    ram  dmem ( 
        . clk(clk),
        . wena(dm_wena), . addr(real_dm_addr), 
        . data_in(dm_wdata), . data_out(dm_rdata));

    wire [31:0] ledoutput;
    assign ledoutput = {
        reg_two_six[31-28:0],reg_two_six[63-28:32], 
        reg_two_six[95-28:64] ,reg_two_six[127-28:96],
        reg_two_six[159-28:128],12'hfff
        };
    seg7x16 led(clk_in,reset,1,ledoutput,o_seg,o_sel);
endmodule
