module sequence_detector_tb();

    wire data_out;

    reg data_in,clk,reset;

    sequence_detector uut(data_out,data_in,clk,reset);

    initial clk = 0;

    always #5 clk = ~clk;

    always @ (posedge clk) begin

        #3;
        $display("t = %0t , RESET = %b , INPUT = %b , OUTPUT = %b ",$time,reset,data_in,data_out);

    end

    initial begin 

        $dumpfile("sequence_detector.vcd");
        $dumpvars(0,sequence_detector_tb);

        data_in=1'b0;reset=1;#20;
        reset=0;#20;

        @(posedge clk);#2;data_in=1'b1;
        @(posedge clk);#2;data_in=1'b0;
        @(posedge clk);#2;data_in=1'b1;
        @(posedge clk);#2;data_in=1'b1;
        @(posedge clk);#2;data_in=1'b0;
        @(posedge clk);#2;data_in=1'b1;
        @(posedge clk);#2;data_in=1'b1;
        @(posedge clk);#10;

        $finish;

    end

endmodule