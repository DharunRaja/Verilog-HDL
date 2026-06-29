module universal4bitsrtb();

    reg [3:0]D;
    reg [1:0]mode;
    reg clk,si_r,si_l;

    wire [3:0]Q;

    universalsr4bit uut(Q,D,mode,clk,si_l,si_r);

    initial clk = 0;

    always #5 clk = ~clk;

    always @(posedge clk)

        begin

            #1;
            $display("CLOCK = %b , Mode = %b , D = %b , Q = %b",clk,mode,D,Q);

        end

    initial begin

        $dumpfile("universal4bitsr.vcd");
        $dumpvars(0,universal4bitsrtb);

        // Test parallel load
        D=4'b1010; mode=2'b11; si_r=0; si_l=0; #20;

        // Test hold — Q should stay 1010
        D=4'b1111; mode=2'b00; si_r=0; si_l=0; #20;

        // Test shift right by 4 — with si_r=1
        mode=2'b01; si_r=1; si_l=0; #20;
        mode=2'b01; si_r=1; si_l=0; #20;
        mode=2'b01; si_r=1; si_l=0; #20;
        mode=2'b01; si_r=1; si_l=0; #20;

        // Test parallel load again
        D=4'b1100; mode=2'b11; si_r=0; si_l=0; #20;

        // Test shift left by 4 — with si_l=1
        mode=2'b10; si_r=0; si_l=1; #20;
        mode=2'b10; si_r=0; si_l=1; #20;
        mode=2'b10; si_r=0; si_l=1; #20;
        mode=2'b10; si_r=0; si_l=1; #20;

        $finish;

    end

endmodule