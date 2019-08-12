`timescale 1ns / 1ps
module clk_divider(
    input [10:0] rate,//·ÖµÄ±¶Êý
    input reset,
    input clk_in,
    output reg clk
    );
    integer count;
    always @ (posedge clk_in or posedge reset)
    begin
        if(reset == 1)
        begin
            count <= 1;
            clk <= 0;
        end
        else if(count==rate)
            begin
                clk <= ~clk;
                count <= 1;
            end
        else
            count <= count+1 ;
    end
endmodule