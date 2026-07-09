module UART_tx(tx,tx_busy,data_in,tx_start,clk,reset);

    output reg tx,tx_busy;
    input [7:0] data_in;
    input tx_start,clk,reset;

    reg [1:0] state;
    reg [2:0] bit_index;
    reg [3:0] baud_counter;

    parameter IDLE=2'b00, START=2'b01, DATA=2'b10, STOP=2'b11;
    parameter BIT_PERIOD = 16;

    always @(posedge clk) begin

        if (reset) begin
            state <= IDLE;
            tx_busy <= 1'b0;
            tx <= 1'b1;
            baud_counter <= 4'b0;
            bit_index <= 3'b0;
        end

        else begin

            case(state) 

                IDLE : begin
                    tx_busy <= 1'b0;
                    tx <= 1'b1;
                    if (tx_start && !tx_busy) begin
                        state <= START;
                        tx_busy <= 1'b1;
                    end
                end
                
                START : begin
                    tx <= 1'b0;
                    baud_counter <= baud_counter + 1'b1;
                    if (baud_counter == BIT_PERIOD - 1) begin
                        baud_counter <= 4'b0;
                        state <= DATA;
                        bit_index <= 3'b0;
                    end
                end
                
                DATA : begin
                    tx <= data_in[bit_index];
                    baud_counter <= baud_counter + 1'b1;
                    if (baud_counter == BIT_PERIOD - 1) begin
                        baud_counter <= 4'b0;
                        if (bit_index == 3'b111) begin
                            state <= STOP;
                        end
                        else bit_index <= bit_index + 1;
                    end
                end

                STOP : begin
                    tx <= 1'b1;
                    if (baud_counter == BIT_PERIOD - 1) begin
                        baud_counter <= 4'b0;
                        state <= IDLE;
                        tx_busy <= 1'b0;
                    end
                    else baud_counter <= baud_counter + 1'b1;
                end
            endcase
        end
    end
endmodule