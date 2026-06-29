module priorityencodertb();

reg [7:0] X;
wire [2:0] Y;

priorityencoder8to3 uut(.out(Y),.inp(X));

always @ (X)

    begin

        #1;
        $display("Input = %b || Output = %b ",X,Y);

    end

initial begin 

    $dumpfile("priorityencoder8to3o.vcd");
    $dumpvars(0,priorityencodertb);

    X=8'b10010100;#10;
    X=8'b00101111;#10;
    X=8'b00000000;#10;
    X=8'b11111111;#10;

    $finish;

end

endmodule