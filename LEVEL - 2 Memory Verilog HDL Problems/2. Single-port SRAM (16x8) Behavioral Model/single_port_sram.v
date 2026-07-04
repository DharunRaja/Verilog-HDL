module single_port_sram_16x8(data_out,data_in,wr_en,addr,cs,clk,reset);

    output reg [7:0] data_out;

    input [7:0] data_in;
    input wr_en,cs,clk,reset;
    input [3:0]addr;
    
    reg [7:0] mem [15:0];

    always @(posedge clk) begin
        
        if (reset == 1) data_out <= 8'h00;

        else if ((wr_en == 1) && (cs == 1)) mem[addr] <= data_in;

        else if ((wr_en == 0) && (cs == 1)) data_out <= mem[addr];

    end
        
endmodule