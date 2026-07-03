module fixedpoint_restoringdivider_tb();

    reg [7:0]A;
    reg [3:0]B;
    reg reset,clk,start;

    wire [7:0]Q;
    wire [3:0]R;

    wire done;

    fixedpoint_restoringdivider uut(.Quotient(Q),.Remainder(R),.Done(done),.Dividend(A),.Divider(B),.reset(reset),.clk(clk),.start(start));

    initial clk = 0;

    always #5 clk = ~clk;

    always @ (posedge done) begin

        #1;
        $display("DIVIDEND = %b , DIVIDER = %b || QUOTIENT = %b , REMAINDER = %b",A,B,Q,R);
    end

    initial begin

        $dumpfile("fixed_point_restoring_divider.vcd");
        $dumpvars(0,fixedpoint_restoringdivider_tb);

        A=8'b00000000;B=4'b0000;reset=1'b1;#10;
        reset=1'b0;#10;
        A=8'b11001000;B=4'b1100;start=1'b1;#10;
        start=1'b0;#20

        wait (done);#20;

        A=8'b01100100;B=4'b1010;start=1'b1;#30;
        start=1'b0;#10;

        wait (done);#20;

        $finish;

    end

endmodule