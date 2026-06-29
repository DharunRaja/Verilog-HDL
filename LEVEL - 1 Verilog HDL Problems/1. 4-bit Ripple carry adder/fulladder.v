module FULLADDER(SUM,CARRY,A,B,C_in);
    output SUM;
    output CARRY;
    input A,B;
    input C_in;
    wire C0,C1,C2;
    xor(SUM,A,B,C_in);
    and(C0,A,B);
    and(C1,B,C_in);
    and(C2,A,C_in);
    or(CARRY,C0,C1,C2);
endmodule