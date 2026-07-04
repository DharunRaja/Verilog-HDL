module single_port_sram_16x8_tb();

    wire [7:0] data_out;

    reg [7:0] data_in;
    reg wr_en,cs,clk,reset;
    reg [3:0] addr;

    single_port_sram_16x8 uut(data_out,data_in,wr_en,addr,cs,clk,reset);

    initial clk = 0 ;

    always #5 clk = ~clk;

    always @ (posedge clk) begin

        #1;
        $display("t = %0t , WE = %b , CS = %b , RESET = %b , ADDRESS = %b , INPUT = %h , OUTPUT = %h",$time,wr_en,cs,reset,addr,data_in,data_out);

        end

    initial begin 

        $dumpfile("single_port_sram_16x8.vcd");
        $dumpvars(0,single_port_sram_16x8_tb);

        data_in=8'h00;cs=0;wr_en=0;addr=4'h0;reset = 1;#20;
        reset = 0;#20

        wr_en=1;cs=1;data_in=8'hAB;addr=4'h5;#20;
        wr_en=1;cs=1;data_in=8'hCD;addr=4'hA;#20;
        wr_en=0;cs=1;addr=4'h5;#20;
        addr=4'hA;#20;
        wr_en=1;cs=0;data_in=8'h05;addr=4'h2;#20;
        wr_en=0;cs=0;addr=4'h2;#20;


        $finish;

    end

endmodule