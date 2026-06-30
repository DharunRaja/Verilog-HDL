module arraymultiplier_4x4_tb();

    reg [3:0] A,B;

    wire [7:0] P;

    arraymultiplier_4x4 uut(.P(P),.A(A),.B(B));

    always @ (A,B,P) begin
        
        #1;
        $display(" A = %b , B = %b || OUTPUT = %b",A,B,P);

    end

    initial begin
        
        $dumpfile("4x4_array_multiplier.vcd");
        $dumpvars(0,arraymultiplier_4x4_tb);

        A=4'b0011; B=4'b0101; #10;
        A=4'b1111; B=4'b1111; #10;
        A=4'b0000; B=4'b1111; #10;
        A=4'b1010; B=4'b0110; #10;

        $finish;

    end

endmodule