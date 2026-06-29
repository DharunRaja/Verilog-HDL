module bcdtodisplaydecodertb();

    reg [3:0] bcd;
    wire [6:0] seg;

    bcdtodisplaydecoder uut(seg,bcd);

    always @ (bcd) begin

        #1;
        $display("BCD = %b , SEGMENT = %b",bcd,seg);

    end

    initial begin

        $dumpfile("bcdtodisplaydecoder.vcd");
        $dumpvars(0,bcdtodisplaydecodertb);

        bcd=4'b0000;#5;
        bcd=4'b0001;#5;
        bcd=4'b0010;#5;
        bcd=4'b0011;#5;
        bcd=4'b0100;#5;
        bcd=4'b1111;#5;
        bcd=4'b0101;#5;

        $finish;

    end

endmodule