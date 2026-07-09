module UART_rx_tb();

    wire [7:0] rx_data;
    wire rx_done;

    reg rx,clk,reset;

    UART_rx uut(rx_data,rx_done,rx,clk,reset);

    initial clk = 0;

    always #5 clk = ~clk;

    initial begin 

        $monitor("Time = %0t | CLOCK = %b | RESET = %b | rx = %b | rx_data = %b | rx_done %b",$time,clk,reset,rx,rx_data,rx_done);

        $dumpfile("UART_rx.vcd");
        $dumpvars(0,UART_rx_tb);

        rx=0;reset=1;#30;
        reset=0;#20;

        //one
        rx = 1;#160;
        rx = 0;#160;

        rx = 0;#160;
        rx = 1;#160;
        rx = 1;#160;
        rx = 0;#160;
        rx = 1;#160;
        rx = 1;#160;
        rx = 0;#160;
        rx = 1;#160;

        //two
        rx = 1;#160;
        rx = 0;#160;

        rx = 1;#160;
        rx = 1;#160;
        rx = 1;#160;
        rx = 1;#160;
        rx = 1;#160;
        rx = 1;#160;
        rx = 1;#160;
        rx = 1;#160;

        //three
        rx = 1;#160;
        rx = 0;#160;

        rx = 1;#160;
        rx = 0;#160;
        rx = 1;#160;
        rx = 1;#160;
        rx = 0;#160;
        rx = 0;#160;
        rx = 1;#160;
        rx = 0;#160;

        $finish;

    end
endmodule