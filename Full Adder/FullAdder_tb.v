module FULLADDERTB;
    reg A,B,Cin;
    wire SUM,CARRY;

    FULLADDER uut(SUM,CARRY,A,B,Cin);

    always @(A, B, Cin)
        begin
            #1;
            $display("A=%b B=%b Cin=%b | SUM=%b CARRY=%b", A, B, Cin, SUM, CARRY);
        end


    initial begin
        
        $dumpfile("fulladder.vcd");
        $dumpvars(0,FULLADDERTB);

        A=0;B=0;Cin=0;#10;
        A=0;B=0;Cin=1;#10;
        A=0;B=1;Cin=0;#10;
        A=0;B=1;Cin=1;#10;
        A=1;B=0;Cin=0;#10;
        A=1;B=0;Cin=1;#10;
        A=1;B=1;Cin=0;#10;
        A=1;B=1;Cin=1;#10;

        $finish;

    end

endmodule