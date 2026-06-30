module arraymultiplier_4x4(P,A,B);

    output [7:0] P;
    input [3:0] A,B;

    wire [3:0] P0,P1,P2,P3;
    wire [3:1] S1;
    wire [3:1] S2;
    wire [4:1] C1;
    wire [4:1] C2;
    wire [4:1] C3;

    assign P0[0] = A[0] & B[0];
    assign P0[1] = A[1] & B[0];
    assign P0[2] = A[2] & B[0];
    assign P0[3] = A[3] & B[0];
    assign P1[0] = A[0] & B[1];
    assign P1[1] = A[1] & B[1];
    assign P1[2] = A[2] & B[1];
    assign P1[3] = A[3] & B[1];
    assign P2[0] = A[0] & B[2];
    assign P2[1] = A[1] & B[2];
    assign P2[2] = A[2] & B[2];
    assign P2[3] = A[3] & B[2];
    assign P3[0] = A[0] & B[3];
    assign P3[1] = A[1] & B[3];
    assign P3[2] = A[2] & B[3];
    assign P3[3] = A[3] & B[3];

    assign P[0] = P0[0];

    FULLADDER S1_P01P10(.SUM(P[1]),.CARRY(C1[1]),.A(P0[1]),.B(P1[0]),.C_in(1'b0));
    FULLADDER S1_P02P11(.SUM(S1[1]),.CARRY(C1[2]),.A(P0[2]),.B(P1[1]),.C_in(C1[1]));
    FULLADDER S1_P03P12(.SUM(S1[2]),.CARRY(C1[3]),.A(P0[3]),.B(P1[2]),.C_in(C1[2]));
    FULLADDER S1_P0P13(.SUM(S1[3]),.CARRY(C1[4]),.A(1'b0),.B(P1[3]),.C_in(C1[3]));

    FULLADDER S2_S1P20(.SUM(P[2]),.CARRY(C2[1]),.A(S1[1]),.B(P2[0]),.C_in(1'b0));
    FULLADDER S2_S1P21(.SUM(S2[1]),.CARRY(C2[2]),.A(S1[2]),.B(P2[1]),.C_in(C2[1]));
    FULLADDER S2_S1P22(.SUM(S2[2]),.CARRY(C2[3]),.A(S1[3]),.B(P2[2]),.C_in(C2[2]));
    FULLADDER S2_S1P23(.SUM(S2[3]),.CARRY(C2[4]),.A(C1[4]),.B(P2[3]),.C_in(C2[3]));


    FULLADDER S3_S2P30(.SUM(P[3]),.CARRY(C3[1]),.A(S2[1]),.B(P3[0]),.C_in(1'b0));
    FULLADDER S3_S2P31(.SUM(P[4]),.CARRY(C3[2]),.A(S2[2]),.B(P3[1]),.C_in(C3[1]));
    FULLADDER S3_S2P32(.SUM(P[5]),.CARRY(C3[3]),.A(S2[3]),.B(P3[2]),.C_in(C3[2]));
    FULLADDER S3_S2P33(.SUM(P[6]),.CARRY(P[7]),.A(C2[4]),.B(P3[3]),.C_in(C3[3]));


endmodule