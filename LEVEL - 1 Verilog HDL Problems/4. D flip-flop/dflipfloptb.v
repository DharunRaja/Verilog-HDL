module dflipfloptb();

    reg D,clk,reset,enable;
    wire Q;

    dflipflop uut(.Q(Q),.D(D),.reset(reset),.clk(clk),.enable(enable));

    initial clk = 0;

    always #5 clk=~clk;

    always @ (posedge clk)

        begin

            #1;
            $display("CLOCK = %b , RESET = %b ' ENABLE = %b , D = %b , Q = %b",clk,reset,enable,D,Q);

        end
    
    initial begin

        $dumpfile("dflipflop.vcd");
        $dumpvars(0,dflipfloptb);

        reset=1;enable=0;D=0;#20;
        reset=0;enable=1;D=1;#20;
        reset=0;enable=1;D=0;#20;
        reset=0;enable=0;D=1;#20;
        reset=1;enable=1;D=1;#20;

        $finish;

    end

endmodule