module carrylookaheadadder_4bit(Sum_out,C_out,A,B,C_in);

    output [3:0] Sum_out;
    output C_out;
    input [3:0] A,B;
    input C_in;

    wire [3:0] P,G,C;

    assign P = A ^ B;
    assign G = A & B;

    assign C[0] = C_in;
    assign C[1] = G[0] | (P[0] & C_in);
    assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C_in);
    assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C_in);
    assign C_out = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & C_in);

    assign Sum_out = P^C;

endmodule