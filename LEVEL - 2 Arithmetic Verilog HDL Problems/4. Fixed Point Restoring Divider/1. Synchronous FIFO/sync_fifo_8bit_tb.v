module synchronous_fifo_8bit_tb();

    wire [7:0] data_out;
    wire full,empty;

    reg [7:0] data_in;
    reg wr_en,re_en,clk,reset;

    integer i;

    initial clk = 1'b0;

    always #5 clk = ~clk;

    synchronous_fifo_8bit uut(data_out,full,empty,data_in,wr_en,re_en,clk,reset);

    always @ (posedge clk) begin

        #1;
        $display("t = %0t , RESET = %b , WRITE_ENABLE = %b , READ_ENABLE = %b , INPUT = %b , OUTPUT = %b , FULL = %b , EMPTY = %b",$time,reset,wr_en,re_en,data_in,data_out,full,empty);

        end

    initial begin

        $dumpfile("synchronous_fifo_8bit.vcd");
        $dumpvars(0,synchronous_fifo_8bit_tb);

        //Resetting 
        data_in=8'h00;wr_en=0;re_en=0;reset=1;#20;
        reset=0;#20;

         wr_en=1;
        
        //Writing the value 0 to 8 into the meomory
        for (i = 0; i < 8; i = i + 1) begin
            @(posedge clk);
            data_in = i; #1; 
            end

        @(posedge clk); #1;
        wr_en = 0; #20;

        //Checking if it was Writing or no
        re_en=1;#40;
        wr_en=1;data_in=8'hAA;#20;

        wr_en=0;#20;

        re_en=1;
        
        //Reading FIFO
        for(i=0; i<8 ; i=i+1) @(posedge clk);

        #10;re_en=0;#10;

        @(posedge clk);#1;re_en=1;
        @(posedge clk);#1;re_en=0;

        //Writing new values into the FIFO after reading
        @(posedge clk); #1;wr_en   = 1;data_in = 8'h11;
        @(posedge clk); #1;
        wr_en   = 0; re_en = 1; wr_en = 1;
        data_in = 8'h22;
        @(posedge clk); #1;wr_en = 0;re_en = 0;

        $finish;

    end

endmodule
