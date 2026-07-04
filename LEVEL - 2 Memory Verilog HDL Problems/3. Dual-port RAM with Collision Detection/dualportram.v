module dual_port_ram_16x8(data_out_a,data_out_b,collision,data_in_a,data_in_b,addr_a,addr_b,we_a,we_b,clk,reset);

    output reg [7:0] data_out_a,data_out_b;
    output wire collision;

    input [7:0] data_in_a,data_in_b;
    input [3:0] addr_a,addr_b;
    input we_a,we_b,clk,reset;

    reg [7:0] mem [15:0];

    assign collision = ((addr_a == addr_b) && (we_a || we_b));

    always @(posedge clk) begin

        if (reset == 1) begin

            data_out_a <= 8'h00;
            data_out_b <= 8'h00;

        end

        else if (!collision) begin

            if (we_a) mem[addr_a] <= data_in_a;
            
            else data_out_a <= mem[addr_a];

            if (we_b) mem[addr_b] <= data_in_b;

            else data_out_b <= mem[addr_b];

        end

        else if (collision) begin

            if (!we_a) data_out_a <= mem[addr_a];

            if (!we_b) data_out_b <= mem[addr_b];

        end
        
    end

endmodule