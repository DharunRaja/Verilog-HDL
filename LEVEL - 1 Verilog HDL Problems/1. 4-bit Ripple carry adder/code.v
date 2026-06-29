module rippleadder(SUM,CARRY,A,B,C_in);

    output [3:0]SUM;
    output CARRY;

    input [3:0]A,B;
    input C_in;

    wire C0,C1,C2;

    FULLADDER FA0(SUM[0],C0,A[0],B[0],C_in);
    FULLADDER FA1(SUM[1],C1,A[1],B[1],C0);
    FULLADDER FA2(SUM[2],C2,A[2],B[2],C1);
    FULLADDER FA3(SUM[3],CARRY,A[3],B[3],C2);

endmodule