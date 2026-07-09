module UART_rx(rx_data,rx_done,rx,clk,reset);

    output reg [7:0] rx_data;
    output reg rx_done;

    input rx,clk,reset;

    reg [1:0] state;
    reg [2:0] bit_index;
    reg [3:0] baud_counter;

    reg prev_rx;

    parameter IDLE=2'b00, START=2'b01, DATA=2'b10, STOP=2'b11;
    parameter BIT_PERIOD = 16;

    always @(posedge clk) begin

        if (reset) begin
            rx_data <= 8'b0;
            rx_done <= 0;
            baud_counter <= 4'b0;
            state <= IDLE;
        end

        else begin
            
            case (state)

            IDLE : begin
                rx_done <= 0;
                prev_rx <= rx;
                if (prev_rx == 1 && rx == 0 && !rx_done) state <= START;
            end

            START : begin
                baud_counter <= baud_counter + 1;
                prev_rx <= rx;
                if (baud_counter == (BIT_PERIOD/2)) begin
                    baud_counter <= 4'b0;
                    bit_index <= 3'b0;
                    state <= DATA;
                end 
            end

            DATA : begin
                baud_counter <= baud_counter + 1;
                prev_rx <= rx;
                if (baud_counter == BIT_PERIOD - 1) begin
                    baud_counter <= 0;
                    rx_data[bit_index] <= rx;
                    if (bit_index == 3'b111) state <= STOP;
                    else bit_index <= bit_index + 1;
                end
            end

            STOP : begin
                rx_done <= 1;
                prev_rx <= rx;
                baud_counter <= baud_counter + 1;
                if (baud_counter == BIT_PERIOD - 1) begin
                    baud_counter <= 4'b0;
                    state <= IDLE;
                    rx_data <= {8'b0};
                end
            end
            endcase
        end
    end
endmodule