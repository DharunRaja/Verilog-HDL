module dual_port_ram_16x8_tb();

    wire [7:0] data_out_a,data_out_b;
    wire collision;

    reg [7:0] data_in_a,data_in_b;
    reg [3:0] addr_a,addr_b;
    reg we_a,we_b,clk,reset;

    dual_port_ram_16x8 uut(data_out_a,data_out_b,collision,data_in_a,data_in_b,addr_a,addr_b,we_a,we_b,clk,reset);

    initial clk = 0;

    always #5 clk = ~clk;

    always @(posedge clk) begin

        #1;
        $display("t = %0t, RESET = %b , WRITE_A = %b , INPUT_A = %h , ADDRESS_A = %h , OUTPUT_A = %h ",$time,reset,we_a,data_in_a,addr_a,data_out_a);
        $display("t = %0t, RESET = %b , WRITE_B = %b , INPUT_B = %h , ADDRESS_B = %h , OUTPUT_B = %h ",$time,reset,we_b,data_in_b,addr_b,data_out_b);
        
    end

    initial begin 

        $dumpfile("dual_port_ram_16x8.vcd");
        $dumpvars(0,dual_port_ram_16x8_tb);

        data_in_a=8'h00;we_a=0;addr_a=4'h0;data_in_b=8'h00;we_b=0;addr_b=0;reset=1;#20;

        reset=0;#20;

        data_in_a=8'hAA;we_a=1;addr_a=4'h5;
        data_in_b=8'hBB;we_b=1;addr_b=4'h3;#20

        data_in_a=8'hBC;addr_a=4'h6;
        data_in_b=8'hFF;addr_b=4'h0;#20;

        data_in_b=8'hEE;addr_b=4'hA;#20;

        we_a=0;we_b=0;#20;

        addr_a=4'h3;addr_b=4'h6;#20;

        addr_a=4'h5;addr_b=4'h5;#20;

        addr_a=4'h0;#20;

        $finish;

    end

endmodule