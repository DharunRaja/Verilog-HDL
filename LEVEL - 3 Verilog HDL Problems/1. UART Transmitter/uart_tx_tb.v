module UART_tx_tb();

    wire tx,tx_busy;
    reg [7:0] data_in;
    reg tx_start,clk,reset;

    UART_tx uut(tx,tx_busy,data_in,tx_start,clk,reset);

    initial clk = 0;

    always #5 clk = ~clk;
    
    initial begin

        $monitor("Time: %0t | tx: %b | tx_busy: %b | data_in: %b | tx_start: %b | clk: %b | reset: %b", $time, tx, tx_busy, data_in, tx_start, clk, reset);
        
        $dumpfile("UART_tx.vcd");
        $dumpvars(0, UART_tx_tb);

        data_in = 8'b00000000;tx_start=1'b0;reset=1'b1;#20;
        reset=1'b0;#30;

        tx_start=1'b1;data_in=8'b01001010;#30;
        tx_start=1'b0;#2000;

        tx_start=1'b1;data_in=8'b10101010;#30;
        tx_start=1'b0;#2000;
    
        $finish;
    end
endmodule