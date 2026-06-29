module universalsr4bit(Q,D,mode,clk,si_l,si_r);

    input [3:0] D;
    input [1:0] mode;
    input clk,si_l,si_r;

    output reg [3:0] Q;

    always @ (posedge clk)

        begin
            
            case(mode)

                2'b00: Q <= Q;
                2'b01: Q[3:0] <= {si_r,Q[3:1]};
                2'b10: Q[3:0] <= {Q[2:0],si_l};
                2'b11: Q[3:0] <= D[3:0];
                default : Q = 4'b0000;

            endcase    
         
        end

endmodule