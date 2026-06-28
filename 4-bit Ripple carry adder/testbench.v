module ripplecarrytb;

    reg [3:0]A,B;
    reg Cin;

    wire [3:0]SUM;
    wire CARRY;

    rippleadder uut(
        .SUM(SUM),
        .CARRY(CARRY),
        .A(A),
        .B(B),
        .C_in(Cin));
    
    always @ (A,B,Cin)
    begin
        #1;
        $display("A=%b, B=%b, C_in=%b || SUM=%b, CARRY=%B",A,B,Cin,SUM,CARRY);
    end

    initial begin

        $dumpfile("ripplecarryadder.vcd");
        $dumpvars(0,ripplecarrytb);

        A=4'b0000; B=4'b0000; Cin=0; #10;
        A=4'b0001; B=4'b0001; Cin=0; #10;
        A=4'b0011; B=4'b0001; Cin=0; #10;
        A=4'b0111; B=4'b0001; Cin=0; #10;
        A=4'b1010; B=4'b0101; Cin=0; #10;
        A=4'b1111; B=4'b0001; Cin=0; #10;
        A=4'b1111; B=4'b1111; Cin=0; #10;
        A=4'b1111; B=4'b1111; Cin=1; #10;


        $finish;
    end

endmodule