module synchronous_fifo_8bit(data_out,full,empty,data_in,wr_en,re_en,clk,reset);

    output reg [7:0] data_out;
    output wire full,empty;
    
    input [7:0] data_in;
    input wr_en,re_en,clk,reset;

    reg [7:0] mem [0:7];
    reg [3:0] wr_ptr,re_ptr;

    assign empty = (wr_ptr == re_ptr);
    assign full = (wr_ptr[2:0] == re_ptr[2:0]) && (wr_ptr[3] != re_ptr[3]) ;

    always @ (posedge clk) begin
        
        if (reset == 1) begin

            data_out <= {8'b0};
            wr_ptr <= {4'b0};
            re_ptr <= {4'b0};

            end

        else if (reset == 0) begin 
                
            if (wr_en == 1 && !full) begin

                mem [wr_ptr[2:0]] <= {data_in};
                wr_ptr <= wr_ptr + 1;

                end

            if (re_en == 1 && !empty) begin

                data_out <= {mem [re_ptr[2:0]]};
                re_ptr <= re_ptr + 1;

                end

            end

        end


endmodule