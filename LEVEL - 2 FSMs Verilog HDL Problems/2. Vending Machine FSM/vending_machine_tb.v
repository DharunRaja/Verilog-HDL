module vending_machine_tb();

    wire dispense,change;
    reg coin_5,coin_10,clk,reset;

    vending_machine uut(dispense,change,coin_5,coin_10,clk,reset);

    initial clk = 1'b0;

    always #5 clk = ~clk;

    always @(posedge clk) begin

        #3;
        $display("Time = %0t , RESET = %b , COIN_5 = %b , COIN_10 = %b , DISPENSE = %b , CHANGE = %b",$time,reset,coin_5,coin_10,dispense,change);

    end

    initial begin

        $dumpfile("Vending_machine.vcd");
        $dumpvars(0,vending_machine_tb);

        coin_5 = 1'b0;coin_10 = 1'b0;reset = 1'b1;#20;
        reset = 1'b0;#20;

        //Inserting coin 5 and then coin 10
        @(posedge clk) coin_5 = 1'b1;#2;
        @(posedge clk) coin_10 = 1'b1;#20;

        coin_5 = 1'b0;coin_10 = 1'b0;#20;


        //Inserting coin 10 and then coin 5
        @(posedge clk) coin_10 = 1'b1;#2;
        @(posedge clk) coin_5 = 1'b1;#20;

        coin_5 = 1'b0;coin_10 = 1'b0;#20;

        //Inserting coin 10 and then coin 10
        @(posedge clk) coin_10 = 1'b1;#2;
        @(posedge clk) coin_10 = 1'b1;#20;

        coin_5 = 1'b0;coin_10 = 1'b0;#20;

        //Inserting three coin 5
        @(posedge clk) coin_5 = 1'b1;#2;
        @(posedge clk) coin_5 = 1'b1;#2;
        @(posedge clk) coin_5 = 1'b1;#20;

        $finish;

    end

endmodule