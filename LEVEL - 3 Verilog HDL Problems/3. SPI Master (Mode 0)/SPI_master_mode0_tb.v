module SPI_master_0_tb();

    wire SCLK,MOSI,busy,SS;
    wire [7:0] miso_data;

    reg [7:0] mosi_data;
    reg MISO,start,clk,reset;

    SPI_master_0 uut(SCLK,MOSI,busy,SS,miso_data,mosi_data,start,MISO,clk,reset);

    initial clk = 0;

    always #5 clk = ~clk;

    initial begin
        
        $monitor("TIME = %0t | clk = %b | RESET = %b | START = %b | MOSI_data = %b |  MISO = %b | SCLK = %b | SS = %b | BUSY = %b | MOSI = %b | MISO_data = %b",$time,clk,reset,start,mosi_data,MISO,SCLK,SS,busy,MOSI,miso_data);

        mosi_data=8'b0;start=0;MISO=0;reset=1;#30;
        reset=0;#30;

        start=1;mosi_data=8'b10101100;#10;
        start=0;#5;
        MISO=1;#20;
        MISO=0;#20;
        MISO=1;#20;
        MISO=1;#20;
        MISO=0;#20;
        MISO=1;#20;
        MISO=0;#20;
        MISO=1;#150;

        start=1;mosi_data=8'b11110000;#10;
        start=0;#5;
        MISO=1;#20;
        MISO=1;#20;
        MISO=1;#20;
        MISO=1;#20;
        MISO=1;#20;
        MISO=1;#20;
        MISO=1;#20;
        MISO=1;#150;

        $finish;

    end
endmodule