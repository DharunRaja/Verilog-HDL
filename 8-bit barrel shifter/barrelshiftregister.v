module barrelshiftregister(Y,X,shift,dir);

    output [7:0]Y;
    input [7:0]X;
    input [2:0]shift;
    input dir;
    wire [7:0]RA,RB,LA,LB,LY,RY;


//Right Shift 

    mux_2x1 SR2_7(.out(RA[7]),.in0(X[7]),.in1(1'b0),.sel(shift[2]));
    mux_2x1 SR2_6(.out(RA[6]),.in0(X[6]),.in1(1'b0),.sel(shift[2]));
    mux_2x1 SR2_5(.out(RA[5]),.in0(X[5]),.in1(1'b0),.sel(shift[2]));
    mux_2x1 SR2_4(.out(RA[4]),.in0(X[4]),.in1(1'b0),.sel(shift[2]));
    mux_2x1 SR2_3(.out(RA[3]),.in0(X[3]),.in1(X[7]),.sel(shift[2]));
    mux_2x1 SR2_2(.out(RA[2]),.in0(X[2]),.in1(X[6]),.sel(shift[2]));
    mux_2x1 SR2_1(.out(RA[1]),.in0(X[1]),.in1(X[5]),.sel(shift[2]));
    mux_2x1 SR2_0(.out(RA[0]),.in0(X[0]),.in1(X[4]),.sel(shift[2]));

    mux_2x1 SR1_7(.out(RB[7]),.in0(RA[7]),.in1(1'b0),.sel(shift[1]));
    mux_2x1 SR1_6(.out(RB[6]),.in0(RA[6]),.in1(1'b0),.sel(shift[1]));
    mux_2x1 SR1_5(.out(RB[5]),.in0(RA[5]),.in1(RA[7]),.sel(shift[1]));
    mux_2x1 SR1_4(.out(RB[4]),.in0(RA[4]),.in1(RA[6]),.sel(shift[1]));
    mux_2x1 SR1_3(.out(RB[3]),.in0(RA[3]),.in1(RA[5]),.sel(shift[1]));
    mux_2x1 SR1_2(.out(RB[2]),.in0(RA[2]),.in1(RA[4]),.sel(shift[1]));
    mux_2x1 SR1_1(.out(RB[1]),.in0(RA[1]),.in1(RA[3]),.sel(shift[1]));
    mux_2x1 SR1_0(.out(RB[0]),.in0(RA[0]),.in1(RA[2]),.sel(shift[1]));

    mux_2x1 SR0_7(.out(RY[7]),.in0(RB[7]),.in1(1'b0),.sel(shift[0]));
    mux_2x1 SR0_6(.out(RY[6]),.in0(RB[6]),.in1(RB[7]),.sel(shift[0]));
    mux_2x1 SR0_5(.out(RY[5]),.in0(RB[5]),.in1(RB[6]),.sel(shift[0]));
    mux_2x1 SR0_4(.out(RY[4]),.in0(RB[4]),.in1(RB[5]),.sel(shift[0]));
    mux_2x1 SR0_3(.out(RY[3]),.in0(RB[3]),.in1(RB[4]),.sel(shift[0]));
    mux_2x1 SR0_2(.out(RY[2]),.in0(RB[2]),.in1(RB[3]),.sel(shift[0]));
    mux_2x1 SR0_1(.out(RY[1]),.in0(RB[1]),.in1(RB[2]),.sel(shift[0]));
    mux_2x1 SR0_0(.out(RY[0]),.in0(RB[0]),.in1(RB[1]),.sel(shift[0]));

//Left Shift

    mux_2x1 SL2_7(.out(LA[7]),.in0(X[7]),.in1(X[3]),.sel(shift[2]));
    mux_2x1 SL2_6(.out(LA[6]),.in0(X[6]),.in1(X[2]),.sel(shift[2]));
    mux_2x1 SL2_5(.out(LA[5]),.in0(X[5]),.in1(X[1]),.sel(shift[2]));
    mux_2x1 SL2_4(.out(LA[4]),.in0(X[4]),.in1(X[0]),.sel(shift[2]));
    mux_2x1 SL2_3(.out(LA[3]),.in0(X[3]),.in1(1'b0),.sel(shift[2]));
    mux_2x1 SL2_2(.out(LA[2]),.in0(X[2]),.in1(1'b0),.sel(shift[2]));
    mux_2x1 SL2_1(.out(LA[1]),.in0(X[1]),.in1(1'b0),.sel(shift[2]));
    mux_2x1 SL2_0(.out(LA[0]),.in0(X[0]),.in1(1'b0),.sel(shift[2]));

    mux_2x1 SL1_7(.out(LB[7]),.in0(LA[7]),.in1(LA[5]),.sel(shift[1]));
    mux_2x1 SL1_6(.out(LB[6]),.in0(LA[6]),.in1(LA[4]),.sel(shift[1]));
    mux_2x1 SL1_5(.out(LB[5]),.in0(LA[5]),.in1(LA[3]),.sel(shift[1]));
    mux_2x1 SL1_4(.out(LB[4]),.in0(LA[4]),.in1(LA[2]),.sel(shift[1]));
    mux_2x1 SL1_3(.out(LB[3]),.in0(LA[3]),.in1(LA[1]),.sel(shift[1]));
    mux_2x1 SL1_2(.out(LB[2]),.in0(LA[2]),.in1(LA[0]),.sel(shift[1]));
    mux_2x1 SL1_1(.out(LB[1]),.in0(LA[1]),.in1(1'b0),.sel(shift[1]));
    mux_2x1 SL1_0(.out(LB[0]),.in0(LA[0]),.in1(1'b0),.sel(shift[1]));

    mux_2x1 SL0_7(.out(LY[7]),.in0(LB[7]),.in1(LB[6]),.sel(shift[0]));
    mux_2x1 SL0_6(.out(LY[6]),.in0(LB[6]),.in1(LB[5]),.sel(shift[0]));
    mux_2x1 SL0_5(.out(LY[5]),.in0(LB[5]),.in1(LB[4]),.sel(shift[0]));
    mux_2x1 SL0_4(.out(LY[4]),.in0(LB[4]),.in1(LB[3]),.sel(shift[0]));
    mux_2x1 SL0_3(.out(LY[3]),.in0(LB[3]),.in1(LB[2]),.sel(shift[0]));
    mux_2x1 SL0_2(.out(LY[2]),.in0(LB[2]),.in1(LB[1]),.sel(shift[0]));
    mux_2x1 SL0_1(.out(LY[1]),.in0(LB[1]),.in1(LB[0]),.sel(shift[0]));
    mux_2x1 SL0_0(.out(LY[0]),.in0(LB[0]),.in1(1'b0),.sel(shift[0]));

    assign Y = (dir==1) ? RY : LY;

endmodule