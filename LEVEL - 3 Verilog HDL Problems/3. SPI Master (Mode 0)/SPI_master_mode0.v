module SPI_master_0(SCLK,MOSI,busy,SS,miso_data,mosi_data,start,MISO,clk,reset);

    output reg SCLK,MOSI,busy,SS;
    output reg [7:0] miso_data;

    input [7:0] mosi_data;
    input MISO,start,reset,clk;

    reg [1:0] state;
    reg [3:0] bit_count;

    wire transfer_done; 
    
    assign transfer_done = (bit_count == 8);

    parameter IDLE=2'b00,TRANSFER=2'b01,DONE=2'b10;

    always @(posedge clk)begin
        if (state == TRANSFER && !transfer_done) SCLK <= ~SCLK;
        else SCLK <= 0;
    end

    always @(posedge clk) begin
        
        if (reset) begin
            MOSI <= 1'b0;
            busy <= 1'b0;
            SS <= 1'b0;
            miso_data <= 8'b0;
            state <= IDLE;
            bit_count <= 4'b0;
        end

        else begin

            case(state)

            IDLE : begin
                SS <= 1;
                if (start && !busy) begin
                    SS <= 1'b0;
                    busy <= 1'b1;
                    state <= TRANSFER;
                    MOSI <= mosi_data[7-bit_count];
                end
            end

            TRANSFER : begin
                
                if (transfer_done) state <= DONE;
            end

            DONE : begin
                busy <= 0;
                SS <= 1;
                state <= IDLE;
                bit_count <= 4'b0;
            end
            endcase
        end
    end

    always @(negedge SCLK) begin
        if (state == TRANSFER && bit_count < 8) MOSI <= mosi_data[7 - bit_count];
    end

    always @(posedge SCLK) begin
        if (state == TRANSFER && bit_count < 8) begin
            miso_data[7 - bit_count] <= MISO;
            bit_count <= bit_count + 1;
        end
    end

endmodule