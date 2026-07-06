module sequence_detector(data_out,data_in,clk,reset);

    output reg data_out;

    input data_in;
    input clk,reset;

    reg [1:0] state,next_state;

    parameter S0=2'b00 , S1=2'b01 , S2=2'b10 , S3=2'b11;

    always @ (posedge clk) begin

        if (reset) state <= S0;

        else state <= next_state;

    end

    always @ (*) begin

        case(state)

        S0: begin 
            if (data_in == 1) next_state = S1;
            else next_state = S0;
            data_out = 1'b0;
        end

        S1: begin
            if(data_in == 0) next_state = S2;
            else next_state = S1;
            data_out = 1'b0;
        end

        S2: begin
            if(data_in == 1) next_state = S3;
            else next_state = S0;
            data_out  = 1'b0;
        end

        S3: begin
            if(data_in == 1) begin
                next_state = S1;
                data_out = 1'b1;
            end
            else next_state = S2;
        end

        endcase

    end

endmodule
        