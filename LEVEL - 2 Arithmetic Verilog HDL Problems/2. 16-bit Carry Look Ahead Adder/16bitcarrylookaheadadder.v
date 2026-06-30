module carrylookaheadadder_16bit(SUM,C_out,A,B,C_in);

    output [15:0] SUM;
    output C_out;
    input [15:0] A,B;
    input C_in;
    wire [3:0]C;

    assign C[0] = C_in;

    carrylookaheadadder_4bit CLA_3to0(.Sum_out(SUM[3:0]),.C_out(C[1]),.A(A[3:0]),.B(B[3:0]),.C_in(C[0]));
    carrylookaheadadder_4bit CLA_7to4(.Sum_out(SUM[7:4]),.C_out(C[2]),.A(A[7:4]),.B(B[7:4]),.C_in(C[1]));
    carrylookaheadadder_4bit CLA_11to8(.Sum_out(SUM[11:8]),.C_out(C[3]),.A(A[11:8]),.B(B[11:8]),.C_in(C[2]));
    carrylookaheadadder_4bit CLA_15to12(.Sum_out(SUM[15:12]),.C_out(C_out),.A(A[15:12]),.B(B[15:12]),.C_in(C[3]));

endmodule