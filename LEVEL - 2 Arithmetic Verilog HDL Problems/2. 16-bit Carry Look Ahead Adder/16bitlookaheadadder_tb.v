module carrylookaheadadder_16bit_tb();

    reg [15:0] A,B;
    reg C_in;
    wire [15:0] SUM;
    wire C_out;

    carrylookaheadadder_16bit uut(.SUM(SUM),.C_out(C_out),.A(A),.B(B),.C_in(C_in));

    always  @ (A,B,C_in,SUM,C_out) begin
        
        #1;
        $display("A = %h , B = %h , C_in = %b || SUM = %h , CARRY_OUT = %b ",A,B,C_in,SUM,C_out);

    end

    initial begin 

        $dumpfile("16-bitcarrylookheadadder.vcd");
        $dumpvars(0,carrylookaheadadder_16bit_tb);

        A = 16'h0000; B = 16'h0000; C_in = 0; #10;
        A = 16'h0001; B = 16'h0001; C_in = 0; #10;
        A = 16'h000F; B = 16'h0001; C_in = 0; #10;
        A = 16'h00FF; B = 16'h0001; C_in = 0; #10;
        A = 16'h0FFF; B = 16'h0001; C_in = 0; #10;
        A = 16'hFFFF; B = 16'h0001; C_in = 0; #10;
        A = 16'hFFFF; B = 16'hFFFF; C_in = 0; #10;
        A = 16'h1234; B = 16'h4321; C_in = 0; #10;
        A = 16'hAAAA; B = 16'h5555; C_in = 0; #10;

        $finish;

    end

endmodule