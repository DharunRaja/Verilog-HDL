module barrelshiftregistertb();

    reg [7:0] inp;
    reg [2:0] shamt;
    reg dir;
    wire [7:0] out;

    barrelshiftregister uut(.Y(out),.X(inp),.shift(shamt),.dir(dir));

    always @ (inp,shamt,dir)

        begin
            
            #1;
            $display("Input = %b , Shift = %b , Direction = %b || Output = %b",inp,shamt,dir,out);
        end

    initial begin

        $dumpfile("barrelshiftregister_8bit.vcd");
        $dumpvars(0,barrelshiftregistertb);

        inp=8'b10110010;shamt=3'b001;dir=1'b0;#10;
        inp=8'b10110010;shamt=3'b011;dir=1'b0;#10;
        inp=8'b10110010;shamt=3'b001;dir=1'b1;#10;
        inp=8'b10110010;shamt=3'b011;dir=1'b1;#10;
        inp=8'b11111111;shamt=3'b100;dir=1'b0;#10;
        inp=8'b11111111;shamt=3'b100;dir=1'b1;#10;

        $finish;

    end

endmodule