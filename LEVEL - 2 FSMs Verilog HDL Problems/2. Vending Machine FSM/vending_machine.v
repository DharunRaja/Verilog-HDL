module vending_machine(dispense,change,coin_5,coin_10,clk,reset);

    output reg dispense,change;
    input coin_5,coin_10;
    input clk,reset;

    reg [1:0]state;

    parameter S0 = 2'b00, S5 = 2'b01, S10 = 2'b10 ;

    always @(posedge clk) begin

        if (reset)state <= S0;

        else begin

            case (state)

                S0: begin
                    dispense <= 1'b0;
                    change <= 1'b0;
                    if(coin_5 == 1'b1) state <= S5;

                    else if(coin_10 == 1'b1) state <= S10;
                end

                S5: begin
                    change <= 1'b0;
                    if(coin_5 == 1'b1) begin
                        state <= S10;
                        dispense <= 1'b0;
                    end
                    else if (coin_10 == 1'b1) begin 
                        state <= S0;
                        dispense <= 1'b1;
                    end
                end

                S10: begin
                    dispense <= 1'b1;
                    if(coin_5 == 1'b1) begin
                        state <= S0;
                        change <= 1'b0;
                    end
                    else if (coin_10 == 1'b1) begin
                        state <= S0;
                        change <= 1'b1;
                    end
                end
                
                default : begin
                    state <= S0;
                    dispense <= 1'b0;
                    change <= 1'b0;
                end
            endcase
        end
    end
endmodule

