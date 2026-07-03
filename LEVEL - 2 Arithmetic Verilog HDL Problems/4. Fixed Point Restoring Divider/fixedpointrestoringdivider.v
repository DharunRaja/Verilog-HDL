module fixedpoint_restoringdivider(Quotient,Remainder,Done,Dividend,Divider,reset,clk,start);

    output reg [7:0] Quotient;
    output reg [3:0] Remainder;
    output reg Done;

    input [7:0] Dividend;
    input [3:0] Divider;
    input reset,clk,start;

    reg [7:0] Q;
    reg [4:0] M;
    reg [4:0] PR;
    reg [3:0] counter;
    reg state;

    localparam SHIFT = 1'b0, SUB = 1'b1 ;

    always @ (posedge clk) begin
        
        if (reset == 1) begin

            PR <= 5'b00000;
            Done <= 1'b0;
            Q <= 8'b00000000;
            counter <= 4'b0000;
            Quotient <= 8'b00000000;
            Remainder <= 4'b0000;

        end

        else if (start == 1 ) begin

            PR <= 5'b00000;
            Done <= 1'b0;
            counter <= 4'b0000;
            Q <= {Dividend};
            M <= {1'b0,Divider};
            state <= SHIFT;

        end

        else if (!Done ) begin
            
            case(state)

            SHIFT : begin 
                {PR,Q} <= {PR[3:0],Q,1'b0};
                state <= SUB;
            end

            SUB : begin

                if (PR >= M) begin
                    PR <= PR - M;
                    Q[0] <= 1'b1;
                end

                else begin
                    PR <= PR;
                    Q[0] <= 1'b0;
                end

                counter <= counter + 1;
                state <= SHIFT;

                if (counter ==7) begin 
                    Quotient <= Q;
                    Remainder <= {PR[3:0]};
                    Done <= 1;
                end

            end

            endcase

        end

        else if (Done == 1) begin 
            Quotient <= Q;
            Remainder <= {PR[3:0]};

        end

    end

endmodule